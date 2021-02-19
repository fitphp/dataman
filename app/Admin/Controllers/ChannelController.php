<?php

namespace App\Admin\Controllers;

use App\Models\Channel as Models;
use App\Models\Platform as PlatformModels;
use App\Admin\Repositories\Channel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ChannelController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Channel(['platform']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('parent_id');
            $grid->column('platform.name', trans('channel.fields.platform_name'));
            $grid->column('name');
            $grid->column('title');
            $grid->column('image');
            $grid->column('order');
            $grid->column('created_at');
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
        return Show::make($id, new Channel(['platform']), function (Show $show) {
            $show->field('id');
            $show->field('parent_id');
            $show->field('platform.name');
            $show->field('name');
            $show->field('title');
            $show->field('image');
            $show->field('order');
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
        return Form::make(new Channel(), function (Form $form) {
            $form->display('id');
            $form->select('platform_id', trans('channel.fields.platform_id'))
                ->options(PlatformModels::all()->pluck('name','id'))
                ->default(0)->required();
            $form->select('parent_id', trans('channel.fields.parent_id'))
                ->options(Models::selectOptions())->default(0)->required();
            $form->image('image', trans('channel.fields.image'));
            $form->text('title', trans('channel.fields.title'))->required();
            $form->text('name', trans('channel.fields.name'))
                ->help('必须为唯一值，不可重复', 'fa-info-circle')
                ->required();;
            $form->text('order', trans('channel.fields.order'))
                ->default(0)->required();

            $form->disableListButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
