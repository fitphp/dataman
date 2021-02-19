<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Application;
use App\Models\Category as CategoryModels;
use App\Models\Config as ConfigModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ApplicationController extends AdminController
{
    protected $status = [0 => '下线', 1 => '上线', 2 => '维护', 3 => '测试'];
    protected $status_label = [0 => 'danger', 1 => 'success', 2 => 'dark', 3 => 'warning'];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Application(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('auth')->using(ConfigModel::getValueByKey('auth_level'))->label();
            $grid->column('category_ids', trans('application.category.title'))
                ->display(function ($category_ids) {
                    return CategoryModels::whereIn('id', explode(',', $category_ids))
                        ->get(['title'])->toArray();
                })->pluck('title')->map('ucwords')->label();
            $grid->column('image')->width(40);
            $grid->column('title');
            $grid->type()->using(ConfigModel::getValueByKey('link_type'))->label();
            $grid->column('url')->link();
            $grid->column('order')->sortable();;
            $grid->status()->using($this->status)->dot($this->status_label);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title');
                $filter->equal('category_id', trans('content.category.title'))->select(
                    CategoryModels::selectOptions()
                );
                $filter->equal('type')->select(ConfigModel::getValueByKey('link_type'));
                $filter->like('url');
                $filter->equal('status')->select($this->status);
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
            $show->field('type')->using(ConfigModel::getValueByKey('link_type'));
            $show->field('appid');
            $show->field('url');
            $show->field('order');
            $show->auth()->using(ConfigModel::getValueByKey('auth_level'));
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
        return Form::make(new Application(), function (Form $form) {
            $form->text('title')->required();
            $form->text('subtitle');
            $form->image('image');
            $form->multipleSelect('category_ids')->options(
                CategoryModels::selectOptions()
            )->required();
            $form->radio('type')->options(ConfigModel::getValueByKey('link_type'))->default('h5');
            $form->text('appid');
            $form->url('url')->required();;
            $form->text('order')->default(0);
            $form->select('auth')->options(ConfigModel::getValueByKey('auth_level'))->default(0);
            $form->radio('status')
                ->when(2, function (Form $form){
                    $form->text('remark');
                })
                ->options($this->status)
                ->default(1);

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
