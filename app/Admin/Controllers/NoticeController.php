<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Notice;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class NoticeController extends AdminController
{
    protected $form = [0 => '内部', 1 => '外部'];
    protected $form_label = [0 => 'success',  1 => 'primary'];
    protected $top = [0 => '否', 1 => '是'];
    protected $top_label = [0 => 'success',  1 => 'primary'];
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];

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
            $grid->from()->using($this->form)->label($this->form_label);
            $grid->top()->using($this->top)->label($this->top_label);
            $grid->status()->using($this->status)->dot($this->status_label);
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
            $show->from()->using($this->form);
            $show->top()->using($this->top);
            $show->status()->using($this->status);
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
                $form->width(4)
                    ->radio('from')
                    ->options($this->form)
                    ->default(0);
                $form->width(4)
                    ->switch('top')
                    ->default(0);
                $form->width(4)
                    ->switch('status')
                    ->default(1);
            });

            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
