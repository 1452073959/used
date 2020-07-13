<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\School;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class SchoolController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new School(), function (Grid $grid) {
//            $grid->id->sortable();
            $grid->text;
        
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            // 禁用过滤器按钮
            $grid->disableFilterButton();
            // 禁用
            $grid->disableBatchActions();
//            $grid->disableDeleteButton();
//            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
//            $grid->disableCreateButton();
            $grid->disableViewButton();
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
        return Show::make($id, new School(), function (Show $show) {
            $show->id;
            $show->text;
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new School(), function (Form $form) {
//            $form->display('id');
            $form->text('text');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
