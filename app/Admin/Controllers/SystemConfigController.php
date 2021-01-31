<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\SystemConfig;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class SystemConfigController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SystemConfig(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('key');
            $grid->column('value');
            $grid->type()->using([0 => '否', 1 => '是']);
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

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
        return Show::make($id, new SystemConfig(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('key');
            $show->field('value');
            $show->type()->using([0 => '否', 1 => '是']);
            $show->field('remark');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new SystemConfig(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->text('key')->required()->placeholder('请输入唯一键值');
            $form->text('value');
            $form->radio('type')->options([0=>'否', 1=>'是'])->default(0);
            $form->editor('remark');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
