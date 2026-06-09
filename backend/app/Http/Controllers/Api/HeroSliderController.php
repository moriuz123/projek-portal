<?php
namespace App\Http\Controllers\Api;


use App\Http\Controllers\Controller;
use App\Models\HeroSlider;

class HeroSliderController extends Controller
{
    public function index()
    {
        return response()->json(
            HeroSlider::where('aktif', 1)->orderBy('order')->get()
        );
    }
}
