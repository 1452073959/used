<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    //获取用户信息
    public function show(User $user)
    {
        return $this->success($user);
    }
    //修改用户信息
    public function updateuser(User $user,Request $request)
    {
        $res= $user->update($request->all());
        return $this->success($user);
    }
}
