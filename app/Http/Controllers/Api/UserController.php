<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\User;
use Illuminate\Http\Request;

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
//        $user=$request->user();
        $user = auth('api')->user();
        $res= $user->update($request->all());
        return $this->success($user);
    }
}
