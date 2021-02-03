<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Dict;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class DictController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Dict(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('key')->link(function () {
                return admin_url('dict/'.$this->id);
            }, '_self');
            $grid->status()->using([0 => '停用', 1 => '正常'])->label([
                0 => 'danger',
                1 => 'primary'
            ]);
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('dict.fields.name'));
                $filter->like('key', trans('dict.fields.key'));
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
        return Show::make($id, new Dict(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('key');
            $show->field('value')->view('dict.kv');
            $show->status()->using([0 => '停用', 1 => '正常']);
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
        return Form::make(new Dict(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->text('key')->required();
            $form->keyValue('value', '字典表');
            $form->radio('status')
                ->options([0=>'停用', 1=>'正常'])
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
