<?php

namespace Database\Seeders;

use BookStack\Activity\Models\Tag;
use BookStack\Entities\Models\Book;
use BookStack\Entities\Models\Bookshelf;
use BookStack\Entities\Models\Chapter;
use BookStack\Entities\Models\Page;
use BookStack\Permissions\JointPermissionBuilder;
use BookStack\Permissions\Models\EntityPermission;
use BookStack\Search\SearchIndex;
use BookStack\Uploads\Attachment;
use BookStack\Users\Models\Role;
use BookStack\Users\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class BenchmarkSeeder extends Seeder
{
    private array $users = [];
    private array $books = [];
    private int $priority = 1;

    public function run(): void
    {
        $this->seedUsers();
        $this->seedContent();
        $this->seedTags();
        $this->seedAttachments();
        $this->setEntityPermissions();

        app(JointPermissionBuilder::class)->rebuildForAll();
        app(SearchIndex::class)->indexAllEntities();
    }

    private function seedUsers(): void
    {
        $admin = User::query()->where('email', 'admin@admin.com')->first();
        if ($admin) {
            $admin->password = Hash::make('Bk$tack!Adm1n2024');
            $admin->save();
        }
        $this->users['admin'] = $admin;

        $editorRole = Role::getRole('Editor');
        $viewerRole = Role::getRole('Viewer');

        $usersData = [
            ['name' => 'Sarah Chen',    'email' => 'sarah.chen@company.io',   'password' => 'R3adM0re#Books77', 'slug' => 'sarah-chen',    'role' => $editorRole, 'key' => 'sarah'],
            ['name' => 'James Miller',  'email' => 'james.miller@company.io', 'password' => 'Wr1t3&Publ!sh42',  'slug' => 'james-miller',  'role' => $editorRole, 'key' => 'james'],
            ['name' => 'Priya Sharma',  'email' => 'priya.sharma@company.io', 'password' => 'V1ew0nly$Docs88',  'slug' => 'priya-sharma',  'role' => $viewerRole, 'key' => 'priya'],
        ];

        foreach ($usersData as $data) {
            if (User::query()->where('email', $data['email'])->exists()) {
                $this->users[$data['key']] = User::query()->where('email', $data['email'])->first();
                continue;
            }

            $user = new User();
            $user->name = $data['name'];
            $user->email = $data['email'];
            $user->password = Hash::make($data['password']);
            $user->email_confirmed = true;
            $user->slug = $data['slug'];
            $user->save();
            $user->roles()->sync([$data['role']->id]);
            $this->users[$data['key']] = $user;
        }
    }

    private function seedContent(): void
    {
        $admin = $this->users['admin'];
        $sarah = $this->users['sarah'];
        $james = $this->users['james'];

        // --- Book 1: Engineering Handbook ---
        $engBook = $this->createBook('Engineering Handbook', 'Standards, processes, and best practices for the engineering team.', $sarah);
        $ch1 = $this->createChapter($engBook, 'Getting Started', 'Onboarding guide for new engineers.', $sarah);
        $this->createPage($ch1, $engBook, 'Development Environment Setup', $this->content('dev-setup'), $sarah);
        $this->createPage($ch1, $engBook, 'Git Workflow and Branch Naming', $this->content('git-workflow'), $sarah);
        $this->createPage($ch1, $engBook, 'Code Review Guidelines', $this->content('code-review'), $sarah);

        $ch2 = $this->createChapter($engBook, 'Architecture', 'System architecture and design decisions.', $sarah);
        $this->createPage($ch2, $engBook, 'Microservices Overview', $this->content('microservices'), $sarah);
        $this->createPage($ch2, $engBook, 'Database Design Patterns', $this->content('db-patterns'), $sarah);

        $ch3 = $this->createChapter($engBook, 'Deployment', 'CI/CD pipelines and deployment processes.', $james);
        $this->createPage($ch3, $engBook, 'CI/CD Pipeline Configuration', $this->content('cicd'), $james);
        $this->createPage($ch3, $engBook, 'Production Checklist', $this->content('prod-checklist'), $james);

        // --- Book 2: HR Policies & Handbook ---
        $hrBook = $this->createBook('HR Policies & Handbook', 'Company policies, benefits, and employee guidelines.', $admin);
        $ch4 = $this->createChapter($hrBook, 'Company Policies', 'Core organizational policies.', $admin);
        $this->createPage($ch4, $hrBook, 'Remote Work Policy', $this->content('remote-work'), $admin);
        $this->createPage($ch4, $hrBook, 'Time Off and Leave Policy', $this->content('time-off'), $admin);
        $this->createPage($ch4, $hrBook, 'Code of Conduct', $this->content('code-of-conduct'), $admin);

        $ch5 = $this->createChapter($hrBook, 'Benefits & Compensation', 'Employee benefits overview.', $admin);
        $this->createPage($ch5, $hrBook, 'Health Insurance Plans', $this->content('health-insurance'), $admin);
        $this->createPage($ch5, $hrBook, 'Stock Option Plan', $this->content('stock-options'), $admin);

        // --- Book 3: Product Roadmap 2026 ---
        $roadmapBook = $this->createBook('Product Roadmap 2026', 'Strategic product direction and quarterly milestones.', $james);
        $ch6 = $this->createChapter($roadmapBook, 'Q1 — Foundation', 'Infrastructure and core platform improvements.', $james);
        $this->createPage($ch6, $roadmapBook, 'API Gateway Migration', $this->content('api-gateway'), $james);
        $this->createPage($ch6, $roadmapBook, 'Performance Benchmarks', $this->content('perf-benchmarks'), $james);

        $ch7 = $this->createChapter($roadmapBook, 'Q2 — Growth', 'User acquisition and feature expansion.', $james);
        $this->createPage($ch7, $roadmapBook, 'Multi-Tenant Architecture', $this->content('multi-tenant'), $james);
        $this->createPage($ch7, $roadmapBook, 'Analytics Dashboard v2', $this->content('analytics-dashboard'), $james);

        // --- Book 4: Security Runbook (restricted) ---
        $secBook = $this->createBook('Security Runbook', 'Incident response procedures and security protocols. Restricted access.', $admin);
        $ch8 = $this->createChapter($secBook, 'Incident Response', 'Step-by-step incident handling procedures.', $admin);
        $this->createPage($ch8, $secBook, 'Incident Severity Classification', $this->content('incident-severity'), $admin);
        $this->createPage($ch8, $secBook, 'Data Breach Response Plan', $this->content('data-breach'), $admin);
        $this->createPage($ch8, $secBook, 'Credential Rotation Procedures', $this->content('credential-rotation'), $admin);

        $ch9 = $this->createChapter($secBook, 'Compliance', 'Regulatory compliance documentation.', $admin);
        $this->createPage($ch9, $secBook, 'SOC 2 Controls Mapping', $this->content('soc2'), $admin);

        // --- Book 5: Team Wiki ---
        $wikiBook = $this->createBook('Team Wiki', 'Shared knowledge base for day-to-day operations.', $sarah);
        $ch10 = $this->createChapter($wikiBook, 'Tools & Services', 'Internal tooling documentation.', $sarah);
        $this->createPage($ch10, $wikiBook, 'Monitoring with Grafana', $this->content('grafana'), $sarah);
        $this->createPage($ch10, $wikiBook, 'Slack Channel Directory', $this->content('slack-channels'), $sarah);

        $ch11 = $this->createChapter($wikiBook, 'Meeting Notes', 'Recurring meeting notes and action items.', $james);
        $this->createPage($ch11, $wikiBook, 'Sprint Retrospective — 2026-W18', $this->content('retro-notes'), $james);
        $this->createPage($ch11, $wikiBook, 'Architecture Review — May 2026', $this->content('arch-review'), $james);

        // --- Shelves ---
        $engShelf = $this->createShelf('Engineering', 'All engineering-related documentation.', $sarah);
        $engShelf->books()->attach([$engBook->id, $roadmapBook->id, $wikiBook->id]);

        $corpShelf = $this->createShelf('Corporate', 'Company-wide policies and procedures.', $admin);
        $corpShelf->books()->attach([$hrBook->id, $secBook->id]);

        $this->books = compact('engBook', 'hrBook', 'roadmapBook', 'secBook', 'wikiBook');
    }

    private function seedTags(): void
    {
        $this->addTags($this->books['engBook'], [
            ['name' => 'department', 'value' => 'engineering', 'order' => 0],
            ['name' => 'status', 'value' => 'active', 'order' => 1],
        ]);
        $this->addTags($this->books['hrBook'], [
            ['name' => 'department', 'value' => 'human-resources', 'order' => 0],
            ['name' => 'confidentiality', 'value' => 'internal', 'order' => 1],
        ]);
        $this->addTags($this->books['roadmapBook'], [
            ['name' => 'department', 'value' => 'product', 'order' => 0],
            ['name' => 'year', 'value' => '2026', 'order' => 1],
        ]);
        $this->addTags($this->books['secBook'], [
            ['name' => 'department', 'value' => 'security', 'order' => 0],
            ['name' => 'confidentiality', 'value' => 'restricted', 'order' => 1],
            ['name' => 'compliance', 'value' => 'soc2', 'order' => 2],
        ]);
        $this->addTags($this->books['wikiBook'], [
            ['name' => 'type', 'value' => 'wiki', 'order' => 0],
            ['name' => 'status', 'value' => 'active', 'order' => 1],
        ]);

        $pages = Page::query()->limit(8)->get();
        $projectValues = ['alpha', 'beta', 'gamma', 'delta'];
        $priorityValues = ['high', 'medium', 'low'];
        foreach ($pages as $i => $page) {
            $this->addTags($page, [
                ['name' => 'project', 'value' => $projectValues[$i % 4], 'order' => 0],
                ['name' => 'priority', 'value' => $priorityValues[$i % 3], 'order' => 1],
            ]);
        }
    }

    private function seedAttachments(): void
    {
        $admin = $this->users['admin'];
        $sarah = $this->users['sarah'];

        $pages = Page::query()->inRandomOrder()->limit(6)->get();
        $attachmentData = [
            ['name' => 'Architecture Diagram.pdf', 'path' => 'https://docs.internal/arch-diagram-v3.pdf'],
            ['name' => 'Onboarding Checklist.xlsx', 'path' => 'https://docs.internal/onboarding-checklist.xlsx'],
            ['name' => 'API Specification.yaml', 'path' => 'https://docs.internal/api-spec-v2.yaml'],
            ['name' => 'Security Audit Report Q1.pdf', 'path' => 'https://docs.internal/security-audit-q1-2026.pdf'],
            ['name' => 'Budget Forecast 2026.xlsx', 'path' => 'https://docs.internal/budget-forecast-2026.xlsx'],
            ['name' => 'Incident Postmortem Template.docx', 'path' => 'https://docs.internal/postmortem-template.docx'],
        ];

        foreach ($pages as $i => $page) {
            if (!isset($attachmentData[$i])) break;
            $d = $attachmentData[$i];
            Attachment::forceCreate([
                'name'        => $d['name'],
                'path'        => $d['path'],
                'extension'   => pathinfo($d['name'], PATHINFO_EXTENSION),
                'uploaded_to' => $page->id,
                'external'    => true,
                'order'       => 1,
                'created_by'  => ($i < 3) ? $sarah->id : $admin->id,
                'updated_by'  => ($i < 3) ? $sarah->id : $admin->id,
            ]);
        }

        $storagePath = storage_path('uploads/files/benchmark');
        if (!is_dir($storagePath)) {
            mkdir($storagePath, 0755, true);
        }

        $localFiles = [
            ['name' => 'meeting-notes-internal.txt', 'content' => "Internal meeting notes — Q2 planning.\nConfidential."],
            ['name' => 'deploy-credentials.env', 'content' => "DB_PASSWORD=s3cur3_pr0d_p@ss\nAPI_KEY=sk-benchmark-fake-key-12345"],
        ];

        $localPages = Page::query()->inRandomOrder()->limit(2)->get();
        foreach ($localPages as $i => $page) {
            if (!isset($localFiles[$i])) break;
            $f = $localFiles[$i];
            $relPath = 'uploads/files/benchmark/' . $f['name'];
            file_put_contents(storage_path($relPath), $f['content']);

            Attachment::forceCreate([
                'name'        => $f['name'],
                'path'        => $relPath,
                'extension'   => pathinfo($f['name'], PATHINFO_EXTENSION),
                'uploaded_to' => $page->id,
                'external'    => false,
                'order'       => 1,
                'created_by'  => $admin->id,
                'updated_by'  => $admin->id,
            ]);
        }
    }

    private function setEntityPermissions(): void
    {
        $adminRole = Role::getSystemRole('admin');
        $editorRole = Role::getRole('Editor');

        $secBook = $this->books['secBook'];
        $secBook->permissions()->delete();
        $secBook->permissions()->createMany([
            ['role_id' => $adminRole->id, 'view' => true, 'create' => true, 'update' => true, 'delete' => true],
        ]);
        $secBook->save();

        $hrBook = $this->books['hrBook'];
        $hrBook->permissions()->delete();
        $hrBook->permissions()->createMany([
            ['role_id' => $adminRole->id, 'view' => true, 'create' => true, 'update' => true, 'delete' => true],
            ['role_id' => $editorRole->id, 'view' => true, 'create' => false, 'update' => false, 'delete' => false],
        ]);
        $hrBook->save();
    }

    // --- Entity creation helpers (no factories, no Faker) ---

    private function createBook(string $name, string $description, User $owner): Book
    {
        $book = new Book();
        $book->name = $name;
        $book->slug = Str::slug($name);
        $book->description = $description;
        $book->description_html = '<p>' . e($description) . '</p>';
        $book->created_by = $owner->id;
        $book->updated_by = $owner->id;
        $book->owned_by = $owner->id;
        $book->save();
        return $book;
    }

    private function createChapter(Book $book, string $name, string $description, User $owner): Chapter
    {
        $chapter = new Chapter();
        $chapter->name = $name;
        $chapter->slug = Str::slug($name);
        $chapter->description = $description;
        $chapter->description_html = '<p>' . e($description) . '</p>';
        $chapter->priority = $this->priority++;
        $chapter->created_by = $owner->id;
        $chapter->updated_by = $owner->id;
        $chapter->owned_by = $owner->id;
        $book->chapters()->save($chapter);
        return $chapter;
    }

    private function createPage(Chapter $chapter, Book $book, string $name, string $html, User $owner): Page
    {
        $page = new Page();
        $page->name = $name;
        $page->slug = Str::slug($name);
        $page->html = $html;
        $page->text = strip_tags($html);
        $page->revision_count = 1;
        $page->editor = 'wysiwyg';
        $page->priority = $this->priority++;
        $page->book_id = $book->id;
        $page->created_by = $owner->id;
        $page->updated_by = $owner->id;
        $page->owned_by = $owner->id;
        $chapter->pages()->save($page);
        return $page;
    }

    private function createShelf(string $name, string $description, User $owner): Bookshelf
    {
        $shelf = new Bookshelf();
        $shelf->name = $name;
        $shelf->slug = Str::slug($name);
        $shelf->description = $description;
        $shelf->description_html = '<p>' . e($description) . '</p>';
        $shelf->created_by = $owner->id;
        $shelf->updated_by = $owner->id;
        $shelf->owned_by = $owner->id;
        $shelf->save();
        return $shelf;
    }

    private function addTags($entity, array $tags): void
    {
        foreach ($tags as $tag) {
            $entity->tags()->create($tag);
        }
    }

    private function content(string $key): string
    {
        $content = [
            'dev-setup' => '<h2>Development Environment Setup</h2>
<p>This guide walks you through setting up your local development environment.</p>
<h3>Prerequisites</h3>
<ul><li>Docker Desktop 4.x or later</li><li>Node.js 22 LTS</li><li>Git 2.40+</li></ul>
<h3>Steps</h3>
<ol><li>Clone the repository: <code>git clone git@github.com:company/platform.git</code></li><li>Copy the environment file: <code>cp .env.example .env</code></li><li>Start the services: <code>docker compose up -d</code></li><li>Install dependencies: <code>npm install</code></li><li>Run migrations: <code>npm run db:migrate</code></li></ol>
<p>After completing these steps, the application should be available at <code>http://localhost:3000</code>.</p>
<h3>Troubleshooting</h3>
<p>If the database container fails to start, ensure port 5432 is not already in use. Run <code>lsof -i :5432</code> to check.</p>',

            'git-workflow' => '<h2>Git Workflow</h2>
<p>We follow a trunk-based development model with short-lived feature branches.</p>
<h3>Branch Naming Convention</h3>
<ul><li><code>feature/TICKET-123-short-description</code> — new features</li><li><code>fix/TICKET-456-bug-description</code> — bug fixes</li><li><code>chore/description</code> — maintenance tasks</li></ul>
<h3>Pull Request Process</h3>
<ol><li>Create a branch from <code>main</code></li><li>Make your changes with atomic commits</li><li>Open a PR and request at least one review</li><li>Squash-merge into <code>main</code> after approval</li></ol>
<p>All PRs must pass CI checks before merging. Force-pushing to <code>main</code> is prohibited.</p>',

            'code-review' => '<h2>Code Review Guidelines</h2>
<p>Code reviews are a critical part of our development process. They help maintain quality, share knowledge, and catch bugs early.</p>
<h3>For Authors</h3>
<ul><li>Keep PRs small — aim for under 400 lines of diff</li><li>Write a clear description explaining the &quot;why&quot; not just the &quot;what&quot;</li><li>Self-review your diff before requesting reviews</li><li>Respond to feedback within one business day</li></ul>
<h3>For Reviewers</h3>
<ul><li>Review within 4 hours of being assigned</li><li>Focus on logic, security, and maintainability</li><li>Use &quot;nit:&quot; prefix for non-blocking suggestions</li><li>Approve when all blocking comments are resolved</li></ul>',

            'microservices' => '<h2>Microservices Overview</h2>
<p>Our platform consists of the following core services:</p>
<table><thead><tr><th>Service</th><th>Port</th><th>Language</th><th>Database</th></tr></thead>
<tbody><tr><td>auth-service</td><td>8001</td><td>Go</td><td>PostgreSQL</td></tr><tr><td>user-service</td><td>8002</td><td>Go</td><td>PostgreSQL</td></tr><tr><td>notification-service</td><td>8003</td><td>Python</td><td>Redis</td></tr><tr><td>billing-service</td><td>8004</td><td>TypeScript</td><td>PostgreSQL</td></tr><tr><td>api-gateway</td><td>8080</td><td>Go</td><td>—</td></tr></tbody></table>
<h3>Communication</h3>
<p>Services communicate via gRPC for synchronous calls and NATS for asynchronous events. The API gateway handles external HTTP traffic and routes to the appropriate service.</p>',

            'db-patterns' => '<h2>Database Design Patterns</h2>
<p>We follow these patterns across all services that use PostgreSQL.</p>
<h3>Naming Conventions</h3>
<ul><li>Tables: plural snake_case (<code>user_accounts</code>)</li><li>Columns: singular snake_case (<code>created_at</code>)</li><li>Indexes: <code>idx_tablename_columnname</code></li><li>Foreign keys: <code>fk_tablename_reference</code></li></ul>
<h3>Migration Rules</h3>
<ol><li>Every migration must be reversible</li><li>Never modify a migration that has been deployed to staging or production</li><li>Large data migrations must be run as background jobs, not in the migration itself</li></ol>
<h3>Soft Deletes</h3>
<p>Use <code>deleted_at</code> columns for all user-facing data. Hard deletes are only permitted for truly ephemeral data like session records.</p>',

            'cicd' => '<h2>CI/CD Pipeline</h2>
<p>Our CI/CD runs on GitHub Actions with the following stages:</p>
<ol><li><strong>Lint</strong> — ESLint, golangci-lint, Ruff</li><li><strong>Test</strong> — Unit tests with coverage threshold of 80%</li><li><strong>Build</strong> — Docker image build and push to ECR</li><li><strong>Deploy (staging)</strong> — Automatic on merge to <code>main</code></li><li><strong>Deploy (production)</strong> — Manual approval required</li></ol>
<h3>Environment Variables</h3>
<p>Secrets are managed via AWS SSM Parameter Store. Never commit secrets to the repository.</p>
<p>Each service has a <code>deploy/</code> directory containing its Kubernetes manifests and Helm values.</p>',

            'prod-checklist' => '<h2>Production Deployment Checklist</h2>
<p>Before deploying to production, verify all items:</p>
<ul><li>[ ] All CI checks pass on the release branch</li><li>[ ] Database migrations tested on staging</li><li>[ ] Feature flags configured for gradual rollout</li><li>[ ] Rollback plan documented</li><li>[ ] On-call engineer notified</li><li>[ ] Monitoring dashboards reviewed</li><li>[ ] Load test results within acceptable thresholds</li></ul>
<h3>Rollback Procedure</h3>
<p>If issues are detected within the first 15 minutes, run <code>kubectl rollout undo deployment/&lt;service&gt;</code> to revert.</p>',

            'remote-work' => '<h2>Remote Work Policy</h2>
<p>We support a flexible remote-first work environment. This policy applies to all full-time employees.</p>
<h3>Core Hours</h3>
<p>All team members must be available during core hours: <strong>10:00 AM – 2:00 PM</strong> in their local timezone.</p>
<h3>Communication</h3>
<ul><li>Default to Slack for quick questions</li><li>Use video calls for discussions requiring back-and-forth</li><li>Document decisions in the wiki within 24 hours</li></ul>
<h3>Equipment</h3>
<p>The company provides a $2,000 home office stipend for new employees and $500 annually for equipment refreshes.</p>',

            'time-off' => '<h2>Time Off and Leave Policy</h2>
<h3>Paid Time Off (PTO)</h3>
<ul><li>0–2 years tenure: 20 days/year</li><li>3–5 years tenure: 25 days/year</li><li>6+ years tenure: 30 days/year</li></ul>
<h3>Sick Leave</h3>
<p>Unlimited sick leave with manager notification. For absences longer than 3 consecutive days, a doctor\'s note may be requested.</p>
<h3>Parental Leave</h3>
<p>16 weeks fully paid parental leave for all new parents, regardless of gender. Must be taken within the first year.</p>',

            'code-of-conduct' => '<h2>Code of Conduct</h2>
<p>We are committed to providing a welcoming and inclusive environment for everyone.</p>
<h3>Expected Behavior</h3>
<ul><li>Be respectful and considerate in all interactions</li><li>Welcome diverse perspectives and experiences</li><li>Give and receive constructive feedback gracefully</li></ul>
<h3>Reporting</h3>
<p>Report violations to your manager or directly to HR at <a href="mailto:hr@company.io">hr@company.io</a>. All reports are handled confidentially.</p>',

            'health-insurance' => '<h2>Health Insurance Plans</h2>
<p>We offer three tiers of health coverage:</p>
<table><thead><tr><th>Plan</th><th>Monthly Premium</th><th>Deductible</th><th>Coverage</th></tr></thead>
<tbody><tr><td>Basic</td><td>$0</td><td>$3,000</td><td>80% after deductible</td></tr><tr><td>Standard</td><td>$150</td><td>$1,500</td><td>90% after deductible</td></tr><tr><td>Premium</td><td>$350</td><td>$500</td><td>95% after deductible</td></tr></tbody></table>
<p>Dental and vision coverage is included with all plans. Dependents can be added during open enrollment (November).</p>',

            'stock-options' => '<h2>Stock Option Plan</h2>
<p>All full-time employees are eligible for stock options as part of their compensation package.</p>
<h3>Vesting Schedule</h3>
<p>Options vest over 4 years with a 1-year cliff:</p>
<ul><li>Year 1: 25% vests at the cliff date</li><li>Years 2–4: Remaining 75% vests monthly</li></ul>
<h3>Exercise Window</h3>
<p>Upon departure, vested options must be exercised within 90 days.</p>',

            'api-gateway' => '<h2>API Gateway Migration</h2>
<p>We are migrating from Kong to a custom Go-based API gateway to reduce operational costs and improve latency.</p>
<h3>Timeline</h3>
<ul><li><strong>Week 1–2:</strong> Core routing and middleware</li><li><strong>Week 3–4:</strong> Circuit breaker and retry logic</li><li><strong>Week 5–6:</strong> Shadow traffic comparison with Kong</li><li><strong>Week 7–8:</strong> Gradual traffic cutover</li></ul>
<h3>Success Criteria</h3>
<ul><li>p99 latency under 15ms (currently 45ms with Kong)</li><li>Zero downtime during migration</li><li>Full feature parity with existing setup</li></ul>',

            'perf-benchmarks' => '<h2>Performance Benchmarks</h2>
<p>Baseline performance targets for Q1 2026:</p>
<table><thead><tr><th>Metric</th><th>Current</th><th>Target</th></tr></thead>
<tbody><tr><td>API p50 latency</td><td>12ms</td><td>8ms</td></tr><tr><td>API p99 latency</td><td>85ms</td><td>50ms</td></tr><tr><td>Throughput (rps)</td><td>12,000</td><td>20,000</td></tr><tr><td>Error rate</td><td>0.3%</td><td>&lt;0.1%</td></tr></tbody></table>
<p>Benchmarks are run nightly against a staging environment using k6 with 200 virtual users over 10 minutes.</p>',

            'multi-tenant' => '<h2>Multi-Tenant Architecture</h2>
<p>Phase 2 introduces true multi-tenancy to support enterprise customers.</p>
<h3>Data Isolation</h3>
<p>We use a <strong>schema-per-tenant</strong> model in PostgreSQL. Each tenant gets a dedicated schema.</p>
<h3>Routing</h3>
<p>Tenants are identified by subdomain: <code>{tenant}.app.company.io</code>. The API gateway extracts the tenant ID and injects it as a header.</p>
<h3>Limits</h3>
<ul><li>Max 10,000 users per tenant</li><li>50 GB storage per tenant (soft limit)</li><li>Rate limited to 1,000 API calls/minute per tenant</li></ul>',

            'analytics-dashboard' => '<h2>Analytics Dashboard v2</h2>
<p>The next iteration of the analytics dashboard focuses on real-time insights and self-service reporting.</p>
<h3>Key Features</h3>
<ul><li>Real-time event streaming via WebSockets</li><li>Custom report builder with drag-and-drop interface</li><li>Scheduled report delivery via email</li><li>Data export to CSV and Parquet formats</li></ul>
<h3>Tech Stack</h3>
<p>Frontend: React + D3.js. Backend: Clickhouse for analytics queries, Redis for caching aggregations, Go service for the API layer.</p>',

            'incident-severity' => '<h2>Incident Severity Classification</h2>
<table><thead><tr><th>Severity</th><th>Description</th><th>Response Time</th><th>Example</th></tr></thead>
<tbody><tr><td>SEV-1</td><td>Complete outage or data loss</td><td>15 minutes</td><td>Database corruption, auth service down</td></tr><tr><td>SEV-2</td><td>Major feature degraded</td><td>1 hour</td><td>Payment processing failing</td></tr><tr><td>SEV-3</td><td>Minor feature issue</td><td>4 hours</td><td>Dashboard widget not loading</td></tr><tr><td>SEV-4</td><td>Cosmetic or low-impact</td><td>Next business day</td><td>Typo in UI</td></tr></tbody></table>
<h3>Escalation</h3>
<p>SEV-1 and SEV-2 incidents automatically page the on-call engineer and notify the engineering manager.</p>',

            'data-breach' => '<h2>Data Breach Response Plan</h2>
<h3>Immediate Actions (First 30 Minutes)</h3>
<ol><li>Confirm the breach and assess scope</li><li>Isolate affected systems (revoke compromised credentials, block IPs)</li><li>Notify the incident commander and security team lead</li><li>Begin evidence preservation — do not modify or delete logs</li></ol>
<h3>Notification Requirements</h3>
<p>Under GDPR, affected EU users must be notified within 72 hours. California residents must be notified under CCPA. Legal counsel must approve all communications before sending.</p>',

            'credential-rotation' => '<h2>Credential Rotation Procedures</h2>
<p>All production credentials must be rotated according to this schedule:</p>
<table><thead><tr><th>Credential Type</th><th>Rotation Frequency</th><th>Owner</th></tr></thead>
<tbody><tr><td>Database passwords</td><td>Every 90 days</td><td>Platform team</td></tr><tr><td>API keys (internal)</td><td>Every 90 days</td><td>Service owner</td></tr><tr><td>TLS certificates</td><td>Every 365 days</td><td>Platform team</td></tr><tr><td>SSH keys</td><td>Every 180 days</td><td>Individual</td></tr></tbody></table>
<h3>Rotation Process</h3>
<ol><li>Generate the new credential in AWS SSM Parameter Store</li><li>Deploy the application with the new credential (dual-read period)</li><li>Verify functionality with the new credential</li><li>Revoke the old credential</li><li>Update the rotation log in this wiki</li></ol>',

            'soc2' => '<h2>SOC 2 Controls Mapping</h2>
<p>This document maps our internal controls to SOC 2 Trust Services Criteria.</p>
<h3>Security (Common Criteria)</h3>
<ul><li><strong>CC6.1:</strong> Logical access controls — enforced via RBAC with SSO (Okta) and MFA</li><li><strong>CC6.2:</strong> System access restrictions — least privilege; access reviews quarterly</li><li><strong>CC6.3:</strong> Encryption — TLS 1.3 in transit, AES-256 at rest</li><li><strong>CC7.2:</strong> Monitoring — Datadog APM, CloudTrail, centralized logging via ELK</li></ul>
<h3>Availability</h3>
<ul><li><strong>A1.2:</strong> 99.95% uptime SLA — multi-AZ deployment, automated failover</li></ul>',

            'grafana' => '<h2>Monitoring with Grafana</h2>
<p>Our primary monitoring stack is Prometheus + Grafana, deployed in the <code>monitoring</code> namespace.</p>
<h3>Dashboards</h3>
<ul><li><strong>Service Overview:</strong> Request rate, error rate, and latency per service</li><li><strong>Infrastructure:</strong> CPU, memory, disk, and network across all nodes</li><li><strong>Business Metrics:</strong> Signups, active users, and revenue (updated hourly)</li></ul>
<h3>Alerting</h3>
<p>Alerts are routed through PagerDuty. Critical alerts trigger phone calls; warning alerts go to Slack <code>#alerts</code>.</p>',

            'slack-channels' => '<h2>Slack Channel Directory</h2>
<table><thead><tr><th>Channel</th><th>Purpose</th><th>Who Should Join</th></tr></thead>
<tbody><tr><td>#engineering</td><td>General engineering discussion</td><td>All engineers</td></tr><tr><td>#incidents</td><td>Active incident coordination</td><td>On-call, leads</td></tr><tr><td>#deploys</td><td>Deployment notifications (bot)</td><td>All engineers</td></tr><tr><td>#code-review</td><td>PR notifications and discussion</td><td>All engineers</td></tr><tr><td>#random</td><td>Non-work chat</td><td>Everyone</td></tr><tr><td>#product</td><td>Product roadmap discussion</td><td>Product, engineering leads</td></tr><tr><td>#security</td><td>Security alerts and discussion</td><td>Security team, leads</td></tr></tbody></table>',

            'retro-notes' => '<h2>Sprint Retrospective — 2026-W18</h2>
<p><strong>Date:</strong> May 2, 2026 | <strong>Facilitator:</strong> James Miller</p>
<h3>What Went Well</h3>
<ul><li>API gateway migration completed ahead of schedule</li><li>Zero-downtime deployment for billing service v3</li><li>New monitoring dashboards caught a memory leak early</li></ul>
<h3>What Could Be Improved</h3>
<ul><li>Flaky integration tests blocked deploys 3 times this sprint</li><li>Cross-team dependency on auth-service slowed user-service work</li><li>Sprint planning overcommitted — we carried over 2 stories</li></ul>
<h3>Action Items</h3>
<ul><li>Sarah: investigate and fix top 5 flaky tests by end of W19</li><li>James: set up a shared integration test environment by W20</li><li>Team: reduce sprint scope by 15% next sprint as an experiment</li></ul>',

            'arch-review' => '<h2>Architecture Review — May 2026</h2>
<p><strong>Date:</strong> May 9, 2026 | <strong>Attendees:</strong> Sarah Chen, James Miller, Admin</p>
<h3>Topic: Event Sourcing for Audit Trail</h3>
<p>We evaluated replacing the current audit log with an event-sourced architecture using Kafka.</p>
<h3>Pros</h3>
<ul><li>Complete reconstruction of entity state at any point in time</li><li>Decoupled consumers for analytics, compliance, and debugging</li></ul>
<h3>Cons</h3>
<ul><li>Significant complexity increase (schema registry, event versioning)</li><li>Kafka operational overhead — 3-node minimum, partition management</li><li>Current audit log meets compliance requirements as-is</li></ul>
<h3>Decision</h3>
<p><strong>Not now.</strong> We will revisit in Q4 when multi-tenancy is stable. For now, we will add a <code>payload</code> JSONB column to the existing audit table.</p>',
        ];

        return $content[$key] ?? '<p>Content placeholder.</p>';
    }
}
