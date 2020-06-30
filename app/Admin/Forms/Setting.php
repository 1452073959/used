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
        $price->save();
        return $this->success('置顶小时价更新成功.', '/');
    }

    /**
     * Build a form here.
     */
    public function form()
    {
        $this->number('price','价格')->required();
    }

    /**
     * The data of the form.
     *
     * @return array
     */
    public function default()
    {
        $price=Stickprice::find(1);
        return [
            'price'  => $price['price'],
        ];
    }
}
