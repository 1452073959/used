<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
	
    protected $table = 'product';
    public function cate()
    {
        //其中第一个参数是关联模型的类名。第二个参数是当前模型类所属表的外键，//第三个参数是关联模型类所属表的主键：
        return $this->belongsTo(Cate::class,'cid','id');
    }


    /**
     * 一篇商品有多个评论
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function comments()
    {
        return $this->hasMany(Comment::class,'pid','id');
    }

    /**
     * 获取这篇文章的评论以parent_id来分组
     * @return static
     */
    public function getComments()
    {
        return $this->comments()->with('owner')->get()->groupBy('parent_id');
    }
}
