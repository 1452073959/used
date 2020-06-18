<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Comment;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class CommentController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Comment(), function (Grid $grid) {
            $grid->id->sortable();
            $grid->user_id;
            $grid->pid;
            $grid->parent_id;
            $grid->replytime;
            $grid->content;
        
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
        return Show::make($id, new Comment(), function (Show $show) {
            $show->id;
            $show->user_id;
            $show->pid;
            $show->parent_id;
            $show->replytime;
            $show->content;
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Comment(), function (Form $form) {
            $form->display('id');
            $form->text('user_id');
            $form->text('pid');
            $form->text('parent_id');
            $form->text('replytime');
            $form->text('content');
        });
    }
}
