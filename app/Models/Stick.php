<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Stick extends Model
{
	
    protected $table = 'stick';
    public $timestamps = false;


    public function prodect()
    {
        return $this->belongsTo(Product::class,'pid','id');
    }

    protected static function boot()
    {
        parent::boot();
        // 监听模型创建事件，在写入数据库之前触发


//        static::updating(function (Post $post) {
//            echo 'This is updated' . "\n";
//        });
//
//        static::updating(function (Stick $stick) {
//            echo 'This is updating' . "\n";
//        });
//
//        static::updated(function (Stick $stick) {
//            echo 'This is updated' . "\n";
//        });

        static::updating(function ($model) {
            // 如果模型的 no 字段为空
            if (!$model->pid) {
                $model->status = 1;
            }else{
                $model->status = 2;
            }
        });
    }
}
