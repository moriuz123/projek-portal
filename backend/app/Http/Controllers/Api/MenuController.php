<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use App\Http\Controllers\Api\Concerns\FiltersByOpd;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    use FiltersByOpd;

    public function index($type, Request $request)
    {
        $menus = clone $this->applyOpdFilter(Menu::query(), $request);
        $menus = $menus->where('menu_type', $type)
            ->whereNull('parent_id')
            ->where('is_active', true)
            ->orderBy('sort_order')
            ->with(['children' => function ($q) {
                $q->where('is_active', true)->orderBy('sort_order')
                    ->with(['children' => function ($q2) {
                        $q2->where('is_active', true)->orderBy('sort_order');
                    }]);
            }])
            ->get();

        return response()->json([
            'status' => 'success',
            'data' => $menus,
        ]);
    }
}
