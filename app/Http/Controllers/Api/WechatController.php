<?php

namespace App\Http\Controllers\Api;


use Illuminate\Http\Request;
use App\Http\Controllers\Api\Controller;
use EasyWeChat\Factory;
use function EasyWeChat\Kernel\Support\generate_sign;
use Cache;
use App\Models\User;

class WechatController extends Controller
{
    //

    public function wechat(Request $request)
    {
        $data = $request->all();

        $app = \EasyWeChat::miniProgram();
        $wq = $app->auth->session($data['code']); // $code 为wx.login里的code
//        dd($wq);
        if (isset($wq['errcode'])) {
            return $this->failed('code已过期或不正确');
        }
        $weappOpenid = $wq['openid'];
        $weixinSessionKey = encrypt( $wq['session_key']);
        $user = User::where('weapp_openid', $weappOpenid)->first();
        //没有，就注册一个用户
        if (!$user) {
            $user = new User();
            $user->weapp_openid = $weappOpenid;
            $user->token = $weixinSessionKey;
            $user->nickname = $data['userInfo']['nickName'];
            $user->weapp_avatar = $data['userInfo']['avatarUrl'];
            $user->save();

        }else{
            $user->weapp_openid=$weappOpenid;
            $user->token=$weixinSessionKey;
            $user->nickname=$data['userInfo']['nickName'];
            $user->weapp_avatar=$data['userInfo']['avatarUrl'];
            $user->save();
        }
        return $this->success(['openid'=>$weappOpenid,'token'=>$user['token']]);
    }


    //
    public function image()
    {
        $data=Swipe::all();
        $data2=[];
        foreach ($data as $k=>$v)
        {
            $data2=json_decode($v['img'],true);
        }

        foreach ($data2 as $k=>$v)
        {
            $data3[]=config('app.url') . 'uploads/' .$v;
        }

        return $this->success($data3);
    }


    public function cache()
    {

        $value = Cache::get('key');
        $value1 = Cache::get('key1');
        dump($value);
        dump($value1);
    }



}
