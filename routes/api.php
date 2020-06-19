<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

$api = app(\Dingo\Api\Routing\Router::class);
$api->version('v1', [
//    'prefix' => 'auth',
    'namespace' => 'App\Http\Controllers\Api'
], function ($api) {
    // 登录
    $api->post('logincode', 'WechatController@wechat');

    $api->get('test', 'ProductController@test');
    //分类的接口
    $api->get('cate', 'ProductController@cate');
    //评论内容
    Route::get('show','Api\ProductController@show');
    //评论
    Route::get('comments/{product}','Api\ProductController@comments');
    //二维码
    $api->get('qrcode','QrcodeController@qrcode');
    //我发布的的
    $api->get('myrelease','ProductController@myrelease');
    //编辑
    Route::get('myreleaseedit/{product?}','Api\ProductController@myreleaseedit');
    //修改
    Route::any('myreleaseupdate/{product?}','Api\ProductController@myreleaseupdate');
    //删除
    Route::get('myreleasedel/{product?}','Api\ProductController@del');

    //用户
    Route::get('user/{user?}','Api\UserController@show');
    //更新用户
    Route::any('updateuser/{user?}','Api\UserController@updateuser');
    //商品上传
    Route::any('productadd','Api\ProductController@productadd');
    //商品列表
    $api->get('productlist','ProductController@productlist');
    //商品详情
    Route::get('productshow','Api\ProductController@productshow');
    //
//    置顶位
    $api->get('stick','StickController@stick');
    //添加置顶
    $api->get('addstick','StickController@addstick');
});
