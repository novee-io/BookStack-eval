<?php

namespace BookStack\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class EnforceSingleSession
{
    public function handle(Request $request, Closure $next)
    {
        $user = auth()->user();

        if ($user && !$user->isGuest()) {
            $sessionToken = session()->get('single_session_token');
            $dbToken = $user->session_token;

            if ($sessionToken && $dbToken && $sessionToken !== $dbToken) {
                auth()->logout();
                session()->invalidate();
                session()->regenerateToken();

                return redirect('/login')->with('error', trans('auth.session_expired'));
            }
        }

        return $next($request);
    }
}
