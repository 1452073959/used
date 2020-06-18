<?php

namespace App\Http\Controllers\Api;

use App\Models\Cate;
use App\Models\Comment;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\Controller;
use Response;

class ProductController extends Controller
{
    //

    public function cate(Request $request)
    {
        $data= Cate::all();
        return $data;
    }

    public function test()
    {
        $da=Product::with('cate')->get();
         return $this->success($da);
    }

    public function comments(\App\Models\Product $product)
    {
        $user=$this->user;
        $product->comments()->create([
            'content' => request('content'),
            'user_id' => $user['id'],
            'replytime' => date('Y-m-d', time()),
//            'parent_id' => request('parent_id', null),
        ]);
        return $product;
    }

    public function show(Product $product)
    {



//        $comments=Product::with('comments')->where('id',2)->orderBy('id','desc')->get();
//        $product->
        $product->load('comments.owner');
        $comments = $product->getComments();
        $comments['root'] = $comments[''];
        unset($comments['']);
//        $comments = Comment::with('owner','replies.owner')->where('parent_id', '0')->orderBy('id')->get();
        return $comments;
    }

}
