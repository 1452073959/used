<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Stick extends Model
{
	
    protected $table = 'stick';
    public $timestamps = false;
    protected $guarded = [];

    public function prodect()
    {
        return $this->belongsTo(Product::class,'pid','id');
    }

}
