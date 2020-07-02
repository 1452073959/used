<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\Product;
use App\Models\Stick;
use App\Models\Stickprice;
use Illuminate\Http\Request;
use DB;
use Cache;
use function EasyWeChat\Kernel\Support\generate_sign;

class StickController extends Controller
{
    //置顶位列表
    public function stick()
    {
        $data = Stick::get();
        return $this->success($data);
    }

//    public function addstick(Request $request)
//    {
//        $data=$request->all();
//        $order=DB::table('product')->max('order');
//        $stick=Product::find($data['id']);
//        $stick->sticktime=date('Y-m-d H:i:s',time());
//        $stick->endsticktime=$data['endsticktime'];
//        $stick->order=$order+1;
//        $stick->save();
//        $stick->stick()->create([
//            'pid' =>$data['id'],
//            'price' =>$data['price'],
//            'starttime' =>date('Y-m-d H:i:s',time()),
//            'endtime' =>$data['endsticktime'],
//        ]);
//        return $this->success($stick);
//    }

    //置顶价格
    public function price()
    {
        $price = Stickprice::first();
        return $this->success($price);
    }

    //置顶下单
    public function addstick(Request $request)
    {
        $user = auth('api')->user();
//        dd($user);
        $data = $request->all();
        $order = Stick::create([
            'pid' => $data['id'],
            'price' => $data['price'],
            'starttime' => date('Y-m-d H:i:s', time()),
            'endtime' => $data['endsticktime'],
        ]);
        $payment = \EasyWeChat::payment(); // 微信支付

        $result = $payment->order->unify([
            'body' => '订单标题',
            'out_trade_no' => $order['no'],
            'trade_type' => 'JSAPI',  // 必须为JSAPI
            'openid' => $user['weapp_openid'], // 这里的openid为付款人的openid
            'total_fee' => $data['price'] * 100, // 总价
            'notify_url' => config('app.url') . 'api/notify'
        ]);

// 如果成功生成统一下单的订单，那么进行二次签名
        if ($result['return_code'] === 'SUCCESS') {
            // 二次签名的参数必须与下面相同
            $params = [
                'appId' => 'wx5da558002fdd6736',
                'timeStamp' => (string)time(),
                'nonceStr' => $result['nonce_str'],
                'package' => 'prepay_id=' . $result['prepay_id'],
                'signType' => 'MD5',
            ];

            // config('wechat.payment.default.key')为商户的key
            $params['paySign'] = generate_sign($params, config('wechat.payment.default.key'));

            return $params;
        } else {
            return $result;
        }

    }

    public function notify()
    {
        Cache::put('key1', date('Y-m-d H:i:s', time()));
        $app = \EasyWeChat::payment(); // 微信支付
        $response = $app->handlePaidNotify(function ($message, $fail) {
            // 使用通知里的 "微信支付订单号" 或者 "商户订单号" 去自己的数据库找到订单
            Cache::put('key', $message);
            $order = Stick::where('no', $message['out_trade_no'])->first();
            if (!$order || $order['paid_at']) { // 如果订单不存在 或者 订单已经支付过了
                return; // 告诉微信，我已经处理完了，订单没找到，别再通知我了
            }
            if ($message['return_code'] === 'SUCCESS') { // return_code 表示通信状态，不代表支付状态
                // 用户是否支付成功
                $order->status = 2;
                //更新销量,修改库存;
                $max = DB::table('product')->max('order');
                $stick = Product::find($order['pid']);
                $stick->sticktime = date('Y-m-d H:i:s', time());
                $stick->endsticktime = $order['endtime'];
                $stick->order = $max + 1;
                $stick->save();
            } else {
                $order->status = 1;
                return $fail('通信失败，请稍后再通知我');
            }
            $order->save();

        });
        return $response;
    }

    public function cache()
    {

        $value = Cache::get('key');
        $value1 = Cache::get('key1');
        dump($value);
        dump($value1);
    }
    

}
