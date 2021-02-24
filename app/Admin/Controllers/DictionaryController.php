<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Dictionary;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class DictionaryController extends AdminController
{
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];
    protected $is_system = [0 => '否', 1 => '是'];
    protected $is_system_label = [0 => 'success', 1 => 'dark'];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Dictionary(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('key')->link(function () {
                return admin_url('dictionary/'.$this->id);
            }, '_self');
            $grid->column('remark');
            $grid->column('status')->using($this->status)
                ->dot($this->status_label);
            $grid->column('is_system')->using($this->is_system)
                ->dot($this->is_system_label);
            $grid->column('updated_at')->sortable();

            // 搜索
            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('dictionary.fields.name'));
                $filter->like('key', trans('dictionary.fields.key'));
            });

            // 表单右上角
            $grid->disableBatchDelete();

            // 操作按钮
            $grid->actions(function (Grid\Displayers\Actions $actions) {
                if ($actions->row->is_system) {
                    $actions->disableDelete();
                }
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
        return Show::make($id, new Dictionary(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('key');
            $show->field('value')->view('field.kv');
            $show->field('status')->using($this->status);
            $show->field('remark');
            $show->field('is_system')->using($this->is_system);
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
        return Form::make(new Dictionary(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->text('key')->help('用于区分字典键名，系统唯一值，仅支持英文与下划线"_"组成')
                ->required()
                ->creationRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:dictionary"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                )
                ->updateRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:dictionary,key,{{id}},id"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                );

            $form->keyValue('value');
            $form->radio('status')
                ->options($this->status)
                ->default(1)
                ->required();
            $form->text('remark');
            $form->radio('is_system')
                ->help('删除系统字典可能会引起系统错误')
                ->options($this->is_system)
                ->default(0);

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
