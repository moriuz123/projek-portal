<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KategoriDokumenResource\Pages;
use App\Models\KategoriDokumen;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Set;

class KategoriDokumenResource extends Resource
{
    protected static ?string $model = KategoriDokumen::class;

    protected static ?string $navigationIcon = 'heroicon-o-home';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('nama')
                    ->label('Nama')
                    ->required()
                    ->maxLength(255),

                TextInput::make('slug')
                    ->label('Slug')
                    ->required()
                    ->maxLength(255)
                    ->reactive()
                    ->afterStateUpdated(function (Set $set, $state) {
                        $set('slug', str_replace(' ', '-', $state));
                    }),
            ]);
    }


    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                Tables\Columns\TextColumn::make('nama')->searchable(),
                Tables\Columns\TextColumn::make('slug')->searchable(),

            ])
            ->filters([])
            ->actions([
                Tables\Actions\ActionGroup::make([
                    Tables\Actions\ViewAction::make(),
                    Tables\Actions\EditAction::make(),
                    Tables\Actions\DeleteAction::make(),
                ])
                    ->icon('heroicon-m-pencil-square')
                    ->color('danger')
                    ->tooltip('Aksi')
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListKategoriDokumen::route('/'),
            'create' => Pages\CreateKategoriDokumen::route('/create'),
            'edit' => Pages\EditKategoriDokumen::route('/{record}/edit'),
        ];
    }
    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }
}
