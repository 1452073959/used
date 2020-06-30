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

    Route::middleware('jwt.auth')->group(function ($api) {
        //用户
        Route::get('user','Api\UserController@show');
        //更新用户
        Route::post('updateuser','Api\UserController@updateuser');

        //我发布的的
        $api->get('myrelease','Api\ProductController@myrelease');
        //编辑
        Route::get('myreleaseedit/{product?}','Api\ProductController@myreleaseedit');
        //修改
        Route::any('myreleaseupdate/{product?}','Api\ProductController@myreleaseupdate');
        //删除
        Route::get('myreleasedel/{product?}','Api\ProductController@del');
        //评论
        Route::post('comments/{product}','Api\ProductController@comments');
    });
    //商品上传
    Route::any('productadd','Api\ProductController@productadd');
    // 登录
    $api->post('logincode', 'WechatController@wechat');
    //刷新token
    $api->get('token', 'WechatController@tokenupdate');
    $api->get('test', 'ProductController@test');
    //分类的接口
    $api->get('cate', 'ProductController@cate');
    //评论内容
    Route::get('show','Api\ProductController@show');
    //二维码
    $api->get('qrcode','QrcodeController@qrcode');
    //商品列表
    $api->get('productlist','ProductController@productlist');
    //商品详情
    Route::get('productshow','Api\ProductController@productshow');

//    置顶位(废弃)
    $api->get('stick','StickController@stick');
    //添加置顶
    $api->post('addstick','StickController@addstick');
//    置顶小时价
    $api->get('stickprice','StickController@price');
});
