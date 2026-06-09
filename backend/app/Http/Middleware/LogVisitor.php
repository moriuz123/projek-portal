<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\Visitor;
use Carbon\Carbon;

class LogVisitor
{
    public function handle(Request $request, Closure $next)
    {
        $ip = $request->ip();
        $agent = substr($request->header('User-Agent'), 0, 255);
        $path = $request->path();

        // Cek apakah sudah ada kunjungan dari IP + UserAgent dalam 1 jam terakhir
        $exists = Visitor::where('ip_address', $ip)
            ->where('user_agent', $agent)
            ->where('visited_at', '>=', Carbon::now()->subHour())
            ->exists();

        // Hanya catat jika belum ada
        if (!$exists) {
            Visitor::create([
                'ip_address' => $ip,
                'user_agent' => $agent,
                'page' => $path,
                'visited_at' => now(),
            ]);
        }

        return $next($request);
    }
}
