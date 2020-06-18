<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

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
        return $this->hasMany(Comment::class,'parent_id','id')->with('categories','user');
    }
}
