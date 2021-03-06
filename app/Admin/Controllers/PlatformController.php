<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Platform;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class PlatformController extends AdminController
{
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];

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
            $grid->status()->using($this->status)->dot($this->status_label);

            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('platform.fields.name'));
                $filter->like('app_id', trans('platform.fields.app_id'));
                $filter->equal('status')->select($this->status);
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
            $show->status()->using($this->status);
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
            $form->text('name')->required();
            $form->text('app_id')
                ->help('用于区分来源平台，系统唯一值，支持由英文、数字、"."、"-"、"_"组成')
                ->required()
                ->creationRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)$/', "unique:platform"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                )
                ->updateRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)$/', "unique:platform,app_id,{{id}},id"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                );
            $form->text('app_secret');
            $form->radio('status')
                ->options($this->status)
                ->default(1)
                ->required();

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
