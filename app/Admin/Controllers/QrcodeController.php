<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Qrcode;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Controllers\AdminController;

class QrcodeController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Qrcode(), function (Grid $grid) {
            $grid->setActionClass(Grid\Displayers\Actions::class);
//            $grid->id->sortable();
            $grid->title;
//            $grid->text->view('qrcode')->setAttributes(['style' => 'width:50px;height:200px;overflow:hidden;']);;
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
        
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
        return Show::make($id, new Qrcode(), function (Show $show) {
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
        return Form::make(new Qrcode(), function (Form $form) {
// 去除整个工具栏内容
            $form->disableHeader();
            $form->display('id');
            $form->editor('text','二维码内容')->required();;
            $form->disableResetButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
