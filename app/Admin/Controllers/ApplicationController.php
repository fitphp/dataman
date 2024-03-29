<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Application;
use App\Models\Category as CategoryModels;
use App\Models\Dictionary as DictionaryModel;
use App\Models\Platform as PlatformModels;
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
        return Grid::make(new Application(['platform']), function (Grid $grid) {
            // 启用导出功能
            $grid->export()->xlsx();

            $grid->column('id')->sortable();
            $grid->column('platform.name', trans('application.fields.platform_name'));
            $grid->column('auth')->using(
                DictionaryModel::getValueByKey('auth_level')
            )->label();

            $grid->column('category_ids', trans('application.category.title'))
                ->display(function ($category_ids) {
                    return CategoryModels::whereIn('id', $category_ids)->pluck('title');
                })->label();

            $grid->column('image')->width(40);
            $grid->column('title');
            $grid->column('type')->using(
                DictionaryModel::getValueByKey('link_type')
            )->label();
            $grid->column('url')->link();
            $grid->column('order')->sortable();;
            $grid->status()->using($this->status)->dot($this->status_label);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title');
                $filter->equal('category_id', trans('content.category.title'))->select(
                    CategoryModels::selectOptions()
                );
                $filter->equal('type')->select(
                    DictionaryModel::getValueByKey('link_type')
                );
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
            $show->field('platform.name');
            $show->field('title');
            $show->field('subtitle');
            $show->field('image');
            $show->field('category_ids')->as(function ($category_ids) use ($show) {
                return CategoryModels::whereIn('id', $category_ids)->pluck('title');
            })->label();
            $show->field('type')->using(
                DictionaryModel::getValueByKey('link_type')
            );
            $show->field('appid');
            $show->field('url');
            $show->field('order');
            $show->auth()->using(DictionaryModel::getValueByKey('auth_level'));
            $show->status()->using($this->status);
            $show->field('remark');
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
            $form->select('platform_id', trans('application.fields.platform_id'))
                ->options(PlatformModels::pluck('name','id'))
                ->default(0)->required();
            $form->text('title')->required();
            $form->text('subtitle');
            $form->image('image');
            $form->listbox('category_ids')->options(
                CategoryModels::getByGroup('application')
            )->required();
            $form->radio('type')->options(
                DictionaryModel::getValueByKey('link_type')
            )->default('url')->required();
            $form->url('url')->required();
            $form->text('appid');
            $form->number('order')->default(0);
            $form->select('auth')->options(
                DictionaryModel::getValueByKey('auth_level')
            )->default(0);
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
