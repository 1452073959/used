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
    $api->get('version', function() {
        return response('this is version v2');
    });

    //分类的接口
    $api->get('cate', 'ProductController@cate');
    //评论
    Route::get('show/{product}','Api\ProductController@show');
    //获取评论
    Route::get('comments/{product}','Api\ProductController@comments');
//    Route::get('users/{Product}', function (\App\Models\Product $Product) {
//        return $Product->title;
//    });

});
