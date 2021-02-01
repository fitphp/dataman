<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\DictType;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class DictTypeController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new DictType(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('key')->link(function () {
                if ($this->id) {
                    return admin_url('dict/data/?type_id='.$this->id);
                }
            }, '_self');
            $grid->status()->using([0 => '停用', 1 => '正常'])->label([
                0 => 'danger',
                1 => 'primary'
            ]);
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('dict-type.fields.name'));
                $filter->like('key', trans('dict-type.fields.key'));
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
        return Show::make($id, new DictType(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('key');
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
        return Form::make(new DictType(), function (Form $form) {
            $form->text('name')->required();
            $form->text('key')->required();
            $form->radio('status')->options([0=>'停用', 1=>'正常'])->default(1);
            $form->text('remark');
        });
    }
}
