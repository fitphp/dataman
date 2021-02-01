<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\DictData;
use App\Models\DictType as DictTypeModels;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class DictDataController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new DictData(['type']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('type.name', trans('dict-data.type.name'));
            $grid->column('key');
            $grid->column('value');
            $grid->column('order');
            $grid->is_default()->using([0 => '否', 1 => '是']);
            $grid->status()->using([0 => '关闭', 1 => '正常'])->label([ 0 => 'danger', 1 => 'primary']);
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('name', trans('dict-data.fields.name'));
                $filter->like('key', trans('dict-data.fields.key'));
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
        return Show::make($id, new DictData(), function (Show $show) {
            $show->field('id');
            $show->field('type_id');
            $show->field('key');
            $show->field('value');
            $show->field('order');
            $show->is_default()->using([0 => '否', 1 => '是']);
            $show->status()->using([0 => '停用', 1 => '正常'])->label([
                0 => 'danger',
                1 => 'primary'
            ]);
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

        return Form::make(new DictData(), function (Form $form) {
            $form->select('type_id', trans('dict-type.fields.name'))
                ->options(DictTypeModels::all()->pluck('name','id'))
                ->required();
            $form->text('key')->required();
            $form->text('value');
            $form->text('order')->default(0);
            $form->radio('is_default')->options([0=>'否', 1=>'是'])->default(0);
            $form->radio('status')->options([0=>'停用', 1=>'正常'])->default(1);
            $form->text('remark');
        });
    }
}
