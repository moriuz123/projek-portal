<?php

namespace App\Filament\Support;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\Toggle;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;

class OpdFields
{
    public static function form(): array
    {
        return [
            Select::make('opd_id')
                ->label('OPD Pemilik')
                ->relationship('opd', 'nama')
                ->searchable()
                ->preload()
                ->nullable(),

            Toggle::make('tampil_di_portal')
                ->label('Tampil di Portal Utama')
                ->default(true),
        ];
    }

    public static function tableColumns(): array
    {
        return [
            TextColumn::make('opd.nama')
                ->label('OPD')
                ->searchable()
                ->sortable()
                ->toggleable(),
        ];
    }

    public static function filters(): array
    {
        return [
            SelectFilter::make('opd_id')
                ->label('OPD')
                ->relationship('opd', 'nama')
                ->searchable()
                ->preload(),
        ];
    }
}
