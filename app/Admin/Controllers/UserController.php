<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class UserController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new User(), function (Grid $grid) {
//            $grid->id->sortable();
            $grid->model()->with(['schooltitle']);
            $grid->nickname;
            $grid->weapp_avatar->image();
//            $grid->birthday;
            $grid->sex;
            $grid->status->using(['1'=>'否',2=>'是']);
//            $grid->school;
//            $grid->weapp_openid;
//            $grid->token;
//            $grid->created_at;
//            $grid->updated_at->sortable();
            $grid->column('schooltitle.text','学校');
            $grid->filter(function (Grid\Filter $filter) {
                $filter->like('nickname', '昵称');
                $filter->like('schooltitle.text', '学校');
            });
            $grid->disableDeleteButton();
//            $grid->disableEditButton();
            $grid->disableQuickEditButton();
            //关闭新增按钮
            $grid->disableCreateButton();
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
        return Show::make($id, new User(), function (Show $show) {
            $show->id;
            $show->nickname;
            $show->weapp_avatar;
            $show->birthday;
            $show->sex;
            $show->school;
            $show->weapp_openid;
            $show->token;
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
        return Form::make(new User(), function (Form $form) {
//            $form->display('id');
            $form->text('nickname')->disable();;
            $form->image('weapp_avatar')->disable();;
//            $form->text('birthday');
            $form->text('sex');
            $form->radio('status','黑名单')->options(['1' => '否', '2'=> '是'])->default('1');;
            $form->select('school','所属学校')->options(config('app.url').'/api/schooladmin');
//            $form->text('weapp_openid');
//            $form->text('token');
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
            // 去除整个工具栏内容
            $form->disableHeader();
            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
