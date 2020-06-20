<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\Product;
use App\Models\Stick;
use Illuminate\Http\Request;
use DB;
class StickController extends Controller
{
    //置顶位列表
    public function stick()
    {
        $data=Stick::get();
        return $this->success($data);
    }

    public function addstick(Request $request)
    {
        $data=$request->all();
        $order=DB::table('product')->max('order');
        $stick=Product::find($data['id']);
        $stick->sticktime=date('Y-m-d H:i:s',time());
        $stick->endsticktime=$data['endsticktime'];
        $stick->order=$order+1;
        $stick->save();
        $stick->stick()->create([
            'pid' =>$data['id'],
            'price' =>$data['price'],
            'starttime' =>date('Y-m-d H:i:s',time()),
            'endtime' =>$data['endsticktime'],
        ]);
        return $this->success($stick);
    }

}
