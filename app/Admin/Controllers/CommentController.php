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
//            $grid->title // 开启树状表格功能
            $grid->model()->with(['user']);
            $grid->model()->with(['prodect']);
            $grid->model()->with(['childrenCategories']);
//            $grid->id->sortable();
//            $grid->user_id;
            $grid->column('user.nickname','发布人');
            $grid->column('prodect.title','商品');
//            $grid->column('childrenCategories.content','评论');
//            $grid->pid;
//            $grid->parent_id;
            $grid->replytime;
            $grid->content->tree(); ;

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
            });
            // 禁用过滤器按钮
            $grid->disableFilterButton();
//            $grid->disableDeleteButton();
            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
            $grid->disableCreateButton();
            $grid->disableViewButton();
//            关闭操作
//            $grid->disableActions();
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
