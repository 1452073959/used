<?php

namespace App\Admin\Controllers;

use App\Models\Cate;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class CateController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Cate(), function (Grid $grid) {
            $grid->id->sortable();
            $grid->text;
            $grid->image->image();
            // 禁用详情按钮
            $grid->disableViewButton();
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new Cate(), function (Show $show) {
            $show->id;
            $show->title;
            $show->image;
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Cate(), function (Form $form) {
            $form->display('id');
            $form->text('text')->required();
//            $form->text('image');
            $form->image('image','分类图片')->uniqueName()->required();

            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
