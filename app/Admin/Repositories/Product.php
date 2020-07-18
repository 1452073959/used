<?php

namespace App\Admin\Repositories;

use Dcat\Admin\Repositories\EloquentRepository;
use App\Models\Product as ProductModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use DB;
class Product extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = ProductModel::class;

    public function update(Form $form)
    {
        // 获取待编辑的数据
        $attributes = $form->updates();
        $id = $form->getKey();
        if($attributes['endsticktime']){
            $max = DB::table('product')->max('order');
            $attributes['order']=$max + 1;
            $attributes['stickstatus']=2;
            $attributes['sticktime']=date('Y-m-d H:i:s', time());
        }
        // 获取数据主键值

        DB::table('product')->where('id',$id)->update($attributes);
        // 返回成功
        return true;
    }
}
