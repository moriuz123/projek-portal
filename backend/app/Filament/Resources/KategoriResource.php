<?php

namespace App\Filament\Resources;

use App\Models\Kategori;
use Filament\Tables;
use Illuminate\Support\Str;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Forms\Components\TextInput;

use App\Filament\Resources\KategoriResource\Pages;

class KategoriResource extends Resource
{
    protected static ?string $model = Kategori::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Kategori';
    protected static ?string $pluralModelLabel = 'Kategori';
    protected static ?string $slug = 'kategoris';
    protected static ?string $navigationGroup = 'Data Berita';

    public static function form(Form $form): Form
    {
        return $form->schema([
            TextInput::make('nama')
                ->label('Nama Kategori')
                ->required()
                ->maxLength(255)
                // 🔧 Dihapus: ->reactive(), karena menyebabkan kursor lompat
                // 🔧 Diperbaiki: Logic `afterStateUpdated` tetap bisa dipakai jika hati-hati
                ->afterStateUpdated(function (\Filament\Forms\Set $set, $state) {
                    // 🔧 Perbaiki agar hanya update slug jika slug masih kosong atau default
                    $set('slug', Str::slug($state));
                }),

            TextInput::make('slug')
                ->label('Slug')
                ->helperText('Otomatis dibuat dari nama jika dikosongkan')
                ->maxLength(255),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->headerActions([
                Tables\Actions\CreateAction::make()
                    ->label('Tambah Kategori')
                    ->icon('heroicon-o-plus')
                    ->color('success'),

            ])
            ->columns([
                Tables\Columns\TextColumn::make('nama'),
                Tables\Columns\TextColumn::make('slug'),
                Tables\Columns\TextColumn::make('created_at')->dateTime(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListKategoris::route('/'),
            'create' => Pages\CreateKategori::route('/create'),
            'edit' => Pages\EditKategori::route('/{record}/edit'),
        ];
    }
}
