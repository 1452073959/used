<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Product;
use App\Models\Cate;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class ProductController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Product(), function (Grid $grid) {
            $grid->model()->with(['cate']);
            $grid->id->sortable();
//            $grid->cid;
            $grid->column('cate.text','分类');
            $grid->title;
            $grid->description;
            $grid->image->display(function ($pictures) {

                return json_decode($pictures, true);

            })->image(config('app.url'). 'uploads/', 100, 100);;
            $grid->price;
            $grid->tel;
            $grid->status->using([ 1 => '上架',2=>'下架']);
            $grid->created_at;
            $grid->updated_at->sortable();
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
        return Show::make($id, new Product(), function (Show $show) {
            $show->id;
            $show->cid;
            $show->title;
            $show->description;
            $show->image;
            $show->price;
            $show->tel;
            $show->created_at;
            $show->updated_at;
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Product(), function (Form $form) {
            $form->display('id');
//            $form->text('cid');
            $form->select('cid','所属分类')->options('http://used.test/api/cate');
            $form->text('title');
            $form->text('description');
//            $form->text('image');
            $form->multipleImage('image','图片')->uniqueName()->saving(function ($paths) {
                // 也可以转化为json
                return json_encode($paths);
            });
            $form->text('price');
            $form->text('tel');
            $form->radio('status')->options([1 => '上架', 2=> '下架'])->default('1');

            $form->display('created_at');
            $form->display('updated_at');

            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
