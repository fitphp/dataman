<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Application;
use App\Models\Category as CategoryModels;
use App\Models\DictType as DictTypeModel;
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
            $grid->column('category.title', trans('application.category.title'))->label();
            $grid->column('image')->width(40);
            $grid->column('title');
            $grid->type()->using(DictTypeModel::getDataItemByTypeKey('link_type')
                ->pluck('value','key')->toArray())->label();
            $grid->column('url')->link();
            $grid->column('order')->sortable();;
            $grid->column('auth');
            $grid->switch();
            $grid->status()->using([0 => '关闭', 1 => '正常'])->label([ 0 => 'danger', 1 => 'primary']);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title');
                $filter->like('status')->using([0 => '关闭', 1 => '正常']);
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
            $show->field('type');
            $show->field('appid');
            $show->field('url');
            $show->field('order');
            $show->field('auth');
            $show->field('switch');
            $show->field('status');
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
            $form->text('image');
            $form->select('category_id')->options(
                CategoryModels::selectOptions()
            )->default(0)->required();
            $form->radio('type')->options(
                DictTypeModel::getDataItemByTypeKey('link_type')
                    ->pluck('value','key')->toArray()
            )->default('h5');
            $form->text('appid');
            $form->url('url')->required();;
            $form->text('order')->default(0);
            $form->text('auth');
            $form->switch('switch')->default(1);
            $form->radio('status')->options([0 => '停用', 1 => '正常'])->default(1);
        });
    }
}
