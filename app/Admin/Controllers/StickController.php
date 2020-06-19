<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Stick;
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
            $grid->id->sortable();
            $grid->title;
            $grid->status->using([ 1 => '可用',2=>'不可用']);
            $grid->price;
        
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
        return Show::make($id, new Stick(), function (Show $show) {
            $show->id;
            $show->title;
            $show->status;
            $show->price;
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
            $form->text('title');
            $form->text('price');
            $form->radio('status')->options([1 => '可用', 2=> '不可用'])->default('1');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
