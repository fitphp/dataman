<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Category;
use App\Models\Category as Models;
use Dcat\Admin\Show;
use Dcat\Admin\Tree;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Layout\Row;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Http\Controllers\AdminController;


class CategoryController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Category(), function (Grid $grid) {
            // 启用导出功能
            $grid->export()->xlsx();

            $grid->column('id')->sortable();
            $grid->column('parent_id');
            $grid->column('image');
            $grid->column('title');
            $grid->column('name');
            $grid->column('order');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('parent_id');
                $filter->like('title');
                $filter->like('name');
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
        return Show::make($id, new Category(), function (Show $show) {
            $show->field('id', 'ID');
            $show->field('parent_id');
            $show->field('image');
            $show->field('title');
            $show->field('name');
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
        return Form::make(new Category(), function (Form $form) {
            $form->display('id', 'ID');
            $form->select('parent_id')
                ->options(Models::selectOptions())
                ->default(0)
                ->required();;
            $form->image('image');
            $form->text('title')->required();
            $form->text('name')
                ->help('必须为唯一值，仅支持英文与下划线"_"组成')
                ->required()
                ->creationRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]$/', "unique:category"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                )
                ->updateRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]$/', "unique:category,name,{{id}},id"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                );
            $form->number('order')
                ->default(0)
                ->required();

            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
