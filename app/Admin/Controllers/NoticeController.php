<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Notice;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class NoticeController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Notice(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->from()->using([0 => '内部', 1 => '外部'])->label([
                0 => 'success',
                1 => 'primary'
            ]);
            $grid->top()->using([0 => '否', 1 => '是'])->label([
                0 => 'success',
                1 => 'primary'
            ]);
            $grid->status()->using([0 => '关闭', 1 => '正常'])->label([
                0 => 'danger',
                1 => 'primary'
            ]);
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title', trans('notice.fields.title'));
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
        return Show::make($id, new Notice(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->from()->using([0 => '内部', 1 => '外部']);
            $show->top()->using([0 => '否', 1 => '是']);
            $show->status()->using([0 => '关闭', 1 => '正常']);
            $show->field('content');
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
        return Form::make(new Notice(), function (Form $form) {
            $form->row(function (Form\Row $form) {
                $form->text('title')->required();
                $form->editor('content');
            });
            $form->row(function (Form\Row $form) {
                $form->width(4)->radio('from')->options([0 => '内部', 1 => '外部'])->default(0);
                $form->width(4)->switch('top')->default(0);
                $form->width(4)->switch('status')->default(1);
            });
        });
    }
}
