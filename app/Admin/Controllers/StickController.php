<?php

namespace App\Admin\Controllers;

use App\Models\Stick;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class StickController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Stick(), function (Grid $grid) {
            $grid->model()->orderBy('endtime', 'desc');
            $grid->model()->with(['prodect']);
            $grid->column('prodect.title','商品名称');
//            $grid->id->sortable();
            $grid->starttime;
            $grid->endtime;

            $grid->price;
//            $grid->pid;

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });

            $grid->disableDeleteButton();
            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
            $grid->disableCreateButton();
            $grid->disableViewButton();
            //关闭操作
            $grid->disableActions();
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
        return Show::make($id, new Stick(), function (Show $show) {
            $show->id;
            $show->endtime;
            $show->starttime;
            $show->price;
            $show->pid;
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Stick(), function (Form $form) {
            $form->display('id');
            $form->text('endtime');
            $form->text('starttime');
            $form->text('price');
            $form->text('pid');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
