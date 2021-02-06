<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Config;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ConfigController extends AdminController
{
    protected $group = ['basic' => '基础', 'dict' => '字典'];
    protected $group_label = [0 => 'dark', 1 => 'info'];
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Config(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('group')->using($this->group)->label($this->group_label);
            $grid->column('name');
            $grid->column('key')->link(function () {
                return admin_url('dict/'.$this->id);
            }, '_self');
            $grid->column('remark');
            $grid->status()->using($this->status)->dot($this->status_label);
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('config.fields.name'));
                $filter->like('key', trans('config.fields.key'));
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
        return Show::make($id, new Config(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('key');
            $show->field('group')->using($this->group);
            if ('basic' == $show->model()->group) {
                $show->field('value');
            } else {
                $show->field('value')->view('config.kv');
            }
            $show->status()->using($this->status);
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
        return Form::make(new Config(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->text('key')->required();
            $form->radio('group')
                ->when('basic', function (Form $form){
                    $form->text('value');
                })
                ->when('dict', function (Form $form) {
                    $form->keyValue('value', '字典表');
                })
                ->options($this->group)
                ->default(1)
                ->required();
            $form->radio('status')
                ->options($this->status)
                ->default(1)
                ->required();
            $form->text('remark');

            $form->display('created_at');
            $form->display('updated_at');

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
