<?php

namespace App\Admin\Forms;

use App\Models\Stickprice;
use Dcat\Admin\Widgets\Form;
use Symfony\Component\HttpFoundation\Response;

class Setting extends Form
{
    /**
     * Handle the form request.
     *
     * @param array $input
     *
     * @return Response
     */
    public function handle(array $input)
    {
        $price=Stickprice::find(1);
        $price->price=$input['price'];
        $price->appid=$input['appid'];
        $price->path=$input['path'];
        $price->show=$input['show'];
        $price->save();
        return $this->success('更新成功.', '/');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->text('price','价格')->required();
        $this->text('appid','跳转小程序appid')->required();
        $this->radio('show','发布设置')->options([1 => '允许发布', 2=> '不允许'])->required();
        $this->text('path','路径')->help(('小程序路径,不填默认为首页'));
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        $price=Stickprice::find(1);
//        dd($price);
        return [
            'price'  => $price['price'],
            'appid'  => $price['appid'],
            'path'  => $price['path'],
            'show'  => $price['show'],
        ];
    }
}
