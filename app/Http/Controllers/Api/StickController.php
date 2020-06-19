<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\Stick;
use Illuminate\Http\Request;

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
        $stick=Stick::find(1);
        $stick->pid=request('pid', null);
        $stick->save();

    }
}
