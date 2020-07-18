<?php

namespace App\Http\Controllers\Api;

use App\Models\Cate;
use App\Models\Comment;
use App\Models\Product;
use App\Models\School;
use App\Models\Stick;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\Controller;
use Response;
use Carbon\Carbon;
class ProductController extends Controller
{
    //后台分类获取接口
    public function cate(Request $request)
    {
        $data= Cate::all();
        return $data;
    }
    public function schooladmin()
    {
        $data= School::all();
        return $data;
    }

    //
    public function school()
    {
        $data= School::all()->toArray();
        $n = array_column($data, 'text', 'id');
        return $n;
    }


    public function test()
    {
//        $da=Product::with('cate','user')->get();
        $da=Stick::with('prodect')->get();
         return $this->success($da);
    }
//评论
    public function comments(Product $product,Request $request)
    {
        if(!request('content')){
            return  $this->failed('评论不能为空');
        }
        $user = auth('api')->user();
        $product->comments()->create([
            'content' => request('content'),
            'user_id' => $user['id'],
            'replytime' => date('Y-m-d H:i:s',time()),
            'parent_id' => request('parent_id', 0),
        ]);

        return  $this->success($product);
    }
    //评论显示
    public function show(Request $request)
    {
        if(!request('pid')){
            return  $this->failed('商品id不能为空');
        }

        $comments = Comment::with('childrenCategories','user')->where('parent_id',0)->where('pid',request('pid'))->get();

        return $comments;
    }
    //我发布的
    public function myrelease(Request $request)
    {
        $user = auth('api')->user();
        $res=  Product::where('user_id',$user['id'])->orderBy('id','desc')->get();
//       $res=  Product::where('user_id',1)->get();
        return  $this->success($res);
    }

    //编辑
    public function myreleaseedit(Product $product)
    {
        return  $this->success($product);

    }
    //修改
    public function myreleaseupdate(Request $request,Product $product)
    {
       $res= $product->update($request->all());
        return $this->success($product);
    }
    //上下架
    public function productstatus(Product $product)
    {
        $res= $product->update(['status'=>request('status')]);
        return $this->success($product);
    }
    //商品上传
    public function productadd(Product $product,Request $request)
    {
        $user = auth('api')->user();
        $data=$request->all();
        $product=new Product();
        $product->user_id =$user['id'];
        $product->cid =$data['cid'];
        $product->title =$data['title'];
        $product->description =$data['description'];
        $product->price =$data['price'];
        $product->tel =$data['tel'];
        $product->school =$data['school'];
        $product->image =json_encode(array_values($data['image']));
        $product->save();
        return $this->success($product);

    }

    //商品列表
    public function  productlist()
    {
        if(request('school')){
            $where=['status'=>1,'school'=>request('school',request('school'))];
        }else{
            $where=['status'=>1];
        }
        if( request('cid')){
            $data=Product::with('user','schooltitle')->where($where)->where('cid',request('cid'))->orderBy('order','desc')->latest()->get();
        }else{
            $data=Product::with('user','schooltitle')->where($where)->orderBy('order','desc')->latest()->get();
        }

        foreach ($data as $k=>$v)
        {
            if(strtotime(Carbon::now())>strtotime($v['endsticktime'])) {
                $v['order'] = 0;
                $v['sticktime'] = null;
                $v['endsticktime'] = null;
                $v['stickstatus'] = 1;
                $v->save();
            }
            $data[$k]['time']=Carbon::parse($v['created_at'])->diffForHumans();

        }
        return $this->success($data);
    }
    //商品详情
    public function productshow()
    {
        $product=Product::with('user')->find(request('id'));
        $product->pageview++;
        $product->save();
        return $this->success($product);
    }
    //文件上传
    public function upload(Request $request)
    {
        if ($request->hasFile('image')) {
            $path = $request->image->store('img', 'admin');
            return $this->success($path);
        }else{
            return $this->failed('图片未上传');
        }
    }

}
