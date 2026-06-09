<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\Berita;
use App\Models\Pengumuman;
use App\Models\Dokumen;
use App\Models\InformasiLayanan;

class DashboardStatsWidget extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Berita', Berita::count())
                ->description('Jumlah berita tersedia')
                ->color('primary'),

            Stat::make('Pengumuman', Pengumuman::count())
                ->description('Jumlah pengumuman tersedia')
                ->color('success'),

            Stat::make('Dokumen', Dokumen::count())
                ->description('Jumlah dokumen tersedia')
                ->color('warning'),

            Stat::make('Informasi Layanan', InformasiLayanan::count())
                ->description('Jumlah info layanan tersedia')
                ->color('danger'),
        ];
    }
}
