<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

//    $router->get('/', 'HomeController@index');
//    $router->get('/', 'HomeController@index');
    $router->resource('/', 'CateController');
    //分类后台路由
    $router->resource('cate', 'CateController');
    //商品后台路由
    $router->resource('product', 'ProductController');
    //二维码
    $router->resource('qrcode', 'QrcodeController');
    //置顶位管理
    $router->resource('stick', 'StickController');
});
