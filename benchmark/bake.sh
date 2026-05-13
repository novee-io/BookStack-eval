#!/usr/bin/env bash
# Bake seeded BookStack + MySQL images for the poveevee benchmark.
#
# Usage:
#   ./benchmark/bake.sh          # build local images only
#   ./benchmark/bake.sh --push   # build and push to ECR
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TAG="v26.01"
ECR="905020614044.dkr.ecr.us-east-1.amazonaws.com/novee-io"
PUSH=false

if [[ "${1:-}" == "--push" ]]; then
    PUSH=true
fi

echo "=== Step 1: Start app + db for seeding ==="
cd "$SCRIPT_DIR"
docker compose -f compose.bake.yml down -v 2>/dev/null || true
docker compose -f compose.bake.yml up -d --build

echo "=== Step 2: Wait for app to be ready (migrations + Apache) ==="
for i in $(seq 1 90); do
    # Apache only starts after migrations complete (entrypoint is sequential)
    if docker compose -f compose.bake.yml exec -T app \
        php -r "echo @file_get_contents('http://localhost/login') !== false ? 'ok' : 'fail';" 2>/dev/null | grep -q ok; then
        echo "App is ready (HTTP responding)."
        break
    fi
    if [ "$i" -eq 90 ]; then
        echo "ERROR: App did not become ready in time" >&2
        docker compose -f compose.bake.yml logs
        exit 1
    fi
    echo "  Waiting... (attempt $i)"
    sleep 5
done

echo "=== Step 3: Run BenchmarkSeeder ==="
docker compose -f compose.bake.yml exec -T app php artisan db:seed --class=BenchmarkSeeder --force

echo "=== Step 4: Dump the seeded database ==="
docker compose -f compose.bake.yml exec -T db \
    mysqldump -uroot -proot \
    --databases bookstack \
    --add-drop-database \
    --single-transaction \
    --routines \
    --triggers \
    > "$SCRIPT_DIR/bookstack-seed.sql"

echo "  Dump size: $(wc -c < "$SCRIPT_DIR/bookstack-seed.sql") bytes"

echo "=== Step 5: Stop bake containers ==="
docker compose -f compose.bake.yml down -v

echo "=== Step 6: Build production images (linux/amd64) ==="
cd "$REPO_ROOT"

docker buildx build \
    --platform linux/amd64 \
    -f benchmark/Dockerfile \
    -t "bookstack:${TAG}" \
    -t "${ECR}/bookstack:${TAG}" \
    --load \
    .

docker buildx build \
    --platform linux/amd64 \
    -f benchmark/Dockerfile.mysql \
    -t "bookstack-mysql:${TAG}" \
    -t "${ECR}/bookstack-mysql:${TAG}" \
    --load \
    benchmark/

echo ""
echo "=== Images built ==="
echo "  bookstack:${TAG}"
echo "  bookstack-mysql:${TAG}"

if [ "$PUSH" = true ]; then
    echo ""
    echo "=== Step 7: Push to ECR ==="
    aws ecr get-login-password --region us-east-1 \
        | docker login --username AWS --password-stdin "$ECR"
    docker push "${ECR}/bookstack:${TAG}"
    docker push "${ECR}/bookstack-mysql:${TAG}"
    echo "  Pushed to ECR."
fi

echo ""
echo "=== Done ==="
echo "To test locally:"
echo "  cd benchmark && docker compose -f compose.local-test.yml up"
echo "  Open http://localhost:8080"
