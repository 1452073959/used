<?php

namespace App\Admin\Controllers;

use App\Admin\Metrics\Examples;
use App\Http\Controllers\Controller;
use Dcat\Admin\Controllers\Dashboard;
use Dcat\Admin\Layout\Column;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;
use App\Admin\Forms\Setting;
use Dcat\Admin\Widgets\Card;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('置顶小时价及小程序跳转设置')
            ->body(new Card(new Setting()));
    }
}
