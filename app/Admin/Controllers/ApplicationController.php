<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Application;
use App\Models\Category as CategoryModels;
use App\Models\Dict as DictModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ApplicationController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Application(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('category_ids', trans('application.category.title'))
                ->display(function ($category_ids) {
                    return CategoryModels::whereIn('id', explode(',', $category_ids))
                        ->get(['title'])->toArray();
                })->pluck('title')->map('ucwords')->label();
            $grid->column('image')->width(40);
            $grid->column('title');
            $grid->type()->using(DictModel::getValueByKey('link_type'))->label();
            $grid->column('url')->link();
            $grid->column('order')->sortable();;
            $grid->column('auth')->using(DictModel::getValueByKey('auth_level'))->label();
            $grid->status()->using([0 => '关闭', 1 => '正常'])->label([ 0 => 'danger', 1 => 'primary']);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title');
                $filter->equal('category_id', trans('content.category.title'))->select(
                    CategoryModels::selectOptions()
                );
                $filter->equal('type')->select(DictModel::getValueByKey('link_type'));
                $filter->like('url');
                $filter->equal('status')->select([0 => '关闭', 1 => '正常']);
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
        return Show::make($id, new Application(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('subtitle');
            $show->field('image');
            $show->field('category_ids');
            $show->field('type')->using(DictModel::getValueByKey('link_type'));
            $show->field('appid');
            $show->field('url');
            $show->field('order');
            $show->auth()->using(DictModel::getValueByKey('auth_level'));
            $show->status()->using([0 => '关闭', 1 => '正常']);
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
        return Form::make(new Application(), function (Form $form) {
            $form->text('title')->required();
            $form->text('subtitle');
            $form->image('image');
            $form->multipleSelect('category_ids')->options(
                CategoryModels::selectOptions()
            )->required();
            $form->radio('type')->options(DictModel::getValueByKey('link_type'))->default('h5');
            $form->text('appid');
            $form->url('url')->required();;
            $form->text('order')->default(0);
            $form->select('auth')->options(DictModel::getValueByKey('auth_level'))->default(0);
            $form->radio('status')->options([0 => '关闭', 1 => '正常'])->default(1);
        });
    }
}
