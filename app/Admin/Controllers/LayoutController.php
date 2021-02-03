<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Layout;
use App\Models\Notice as NoticeModels;
use App\Models\Content as ContentModels;
use App\Models\Channel as ChannelModels;
use App\Models\Application as ApplicationModels;

use Dcat\Admin\Form;
use Dcat\Admin\Form\NestedForm;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class LayoutController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Layout(['channel']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('channel.title', trans('advert-pin.fields.channel'));
            $grid->type()->using([0 => '应用', 1 => '内容', '2' => '通知'])
                ->label([ 0 => 'success', 1 => 'info', 2 => 'primary']);
            $grid->column('name');
            $grid->column('title');
            $grid->column('subtitle');
            $grid->status()->using([0 => '关闭', 1 => '正常'])
                ->dot([ 0 => 'danger', 1 => 'success']);
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
        return Show::make($id, new Layout(['channel']), function (Show $show) {
            $show->field('id');
            $show->field('channel.title', trans('layout.fields.channel'));
            $show->field('name');
            $show->field('title');
            $show->field('subtitle');
            $show->type()->using([0 => '应用', 1 => '内容', '2' => '通知']);
            $show->field('target');
            $show->status()->using([0 => '关闭', 1 => '正常']);
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
        return Form::make(new Layout(), function (Form $form) {
            $form->display('id');
            $form->select('channel_id')->options(
                ChannelModels::selectOptions()
            )->default(0)->required();
            $form->text('name')
                ->help('必须为唯一值，不可重复', 'fa-info-circle')
                ->required();
            $form->text('title');
            $form->text('subtitle');
            $form->radio('type')
                ->when(0, function (Form $form) {
                    $form->multipleSelect('target')->options(
                        ApplicationModels::all()->pluck('title', 'id')
                    )->default(0)->required();
                })
                ->when(1, function (Form $form) {
                    $form->multipleSelect('target')->options(
                        ContentModels::all()->pluck('title', 'id')
                    )->default(0)->required();
                })
                ->when(2, function (Form $form) {
                    $form->multipleSelect('target')->options(
                        NoticeModels::all()->pluck('title', 'id')
                    )->default(0)->required();
                })
                ->options([0 => '应用', 1 => '内容', 2 => '通知'])
                ->default(0);
            $form->radio('status')
                ->options([0 => '停用', 1 => '正常'])
                ->default(1);
            $form->text('remark');

            $form->display('created_at');
            $form->display('updated_at');

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
