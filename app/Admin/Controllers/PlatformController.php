<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Platform;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class PlatformController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Platform(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('app_id');
            $grid->status()->using([0 => '关闭', 1 => '正常'])->label([
                'default' => 'primary', // 设置默认颜色，不设置则默认为 default
                0 => 'danger',
                1 => 'primary'
            ]);

            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('platform.fields.name'));
                $filter->like('app_id', trans('platform.fields.app_id'));

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
        return Show::make($id, new Platform(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('app_id');
            $show->field('app_secret');
            $show->status()->using([0 => '关闭', 1 => '正常']);
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
        return Form::make(new Platform(), function (Form $form) {
            $form->display('id');
            $form->text('name');
            $form->text('app_id')->required()->placeholder('请输入唯一值');
            $form->text('app_secret');
            $form->switch('status');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
