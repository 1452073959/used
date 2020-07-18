<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class UserController extends Controller
{
    //获取用户信息
    public function show(Request $request)
    {
//        dd($this->user);
        $user = auth('api')->user();
        return $this->success($user);
    }
    //修改用户信息
    public function updateuser(Request $request)
    {
        $n=$request->all();
        $user = auth('api')->user();
        $res=DB::table('users')->where('id',$user['id'])->update($n);
        if($res){
            return $this->success('修改成功');
        }else{
            return $this->failed('修改失败');
        }

    }
}
