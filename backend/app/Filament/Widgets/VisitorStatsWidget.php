<?php

namespace App\Filament\Widgets;

use App\Models\Visitor;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class VisitorStatsWidget extends BaseWidget
{
    protected function getStats(): array
    {
        $totalVisitors = Visitor::count();
        $todayVisitors = Visitor::whereDate('visited_at', today())->count();
        $uniqueIPs = Visitor::distinct('ip_address')->count();

        return [
            Stat::make('Total Kunjungan', number_format($totalVisitors))
                ->description('Semua kunjungan situs'),
            Stat::make('Kunjungan Hari Ini', number_format($todayVisitors))
                ->description('Dihitung sejak 00:00'),
            Stat::make('IP Unik', number_format($uniqueIPs))
                ->description('Pengunjung unik berdasarkan IP'),
        ];
    }
}
