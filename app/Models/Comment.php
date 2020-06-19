<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Comment extends Model
{
	
    protected $table = 'comment';
    public $timestamps = false;

    protected $guarded = [];
    /**
     * 这个评论的所属用户
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id','id');
    }
    public function categories()
    {
        return $this->hasMany(Comment::class,'parent_id','id');
    }
    /**
     * 这个评论的子评论
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
//    public function replies()
//    {
//        return $this->hasMany(Comment::class, 'parent_id','id');
//    }

    public function childrenCategories()
    {
        return $this->categories()->with('childrenCategories','user');
    }


    protected static function boot()
    {
        parent::boot();
        // 监听模型创建事件，在写入数据库之前触发
        static::created(function (Comment $comment) {
           $num= DB::table('comment')->where('pid',$comment['pid'])->count();
          DB::table('product')->where('id',$comment['pid'])->update(['commentnumber'=>$num]);
        });

    }
}
