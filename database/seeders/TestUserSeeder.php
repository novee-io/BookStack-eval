<?php

namespace Database\Seeders;

use BookStack\Users\Models\Role;
use BookStack\Users\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class TestUserSeeder extends Seeder
{
    public function run(): void
    {
        if (User::query()->where('email', 'testuser@test.com')->exists()) {
            return;
        }

        $user = new User();
        $user->name = 'Test User';
        $user->email = 'testuser@test.com';
        $user->password = Hash::make('password123');
        $user->email_confirmed = true;
        $user->slug = 'test-user';
        $user->save();

        $editorRole = Role::query()->where('display_name', 'Editor')->first();
        if ($editorRole) {
            $user->roles()->sync([$editorRole->id]);
        }
    }
}
