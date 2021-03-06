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
            $grid->model()->with(['user']);
            $grid->model()->with(['schooltitle']);
            $grid->id->sortable();
//            $grid->cid;
            $grid->column('user.nickname','发布人');
            $grid->column('cate.text','分类');
            $grid->column('schooltitle.text','学校');
            $grid->title;
//            $grid->description;
            $grid->image->display(function ($pictures) {

                return json_decode($pictures, true);

            })->image(config('app.url'). 'uploads/', 100, 100);;
            $grid->price;
            $grid->tel;
            $grid->status->using([ 1 => '上架',2=>'下架']);
            $grid->stickstatus->using([ 1 => '否',2=>'是']);

//            $grid->created_at;
//            $grid->updated_at->sortable();
            // 禁用详情按钮
            $grid->disableViewButton();
//            $grid->disableDeleteButton();
//            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
            $grid->disableCreateButton();

            $grid->filter(function (Grid\Filter $filter) {

                $filter->like('title', '商品名称');
                $filter->like('user.nickname', '发布人');
                $filter->like('schooltitle.text', '学校');
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
            $form->select('cid','所属分类')->options(config('app.url').'/api/cate');
//            $form->select('school','所属学校')->options(config('app.url').'/api/schooladmin');
            $form->text('title');
            $form->text('description');
//            $form->text('image');
            $form->multipleImage('image','图片')->uniqueName()->saving(function ($paths) {
                // 也可以转化为json
                return json_encode($paths);
            });
            $form->text('price');
            $form->text('tel');
            $form->datetime('endsticktime','置顶结束时间')->help('为空为未置顶/或已过期');
            $form->radio('status')->options([1 => '上架', 2=> '下架'])->default('1');


            $form->display('created_at');
            $form->display('updated_at');

            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            // 去除整个工具栏内容
            $form->disableHeader();
            $form->disableCreatingCheck();
        });
    }
}
