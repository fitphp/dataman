<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\AdvertPosition;
use App\Models\Platform as PlatformModels;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class AdvertPositionController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new AdvertPosition(['platform']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('platform.name', trans('advert-position.fields.platform_name'));
            $grid->column('name');
            $grid->column('title');
            $grid->column('order');
            $grid->column('desc');
            $grid->column('updated_at')->sortable();
            $grid->display('广告列表')->link();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->equal('platform_id')
                    ->select(PlatformModels::pluck('name','id'));
                $filter->like('name');
                $filter->like('title');
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
        return Show::make($id, new AdvertPosition(), function (Show $show) {
            $show->field('id');
            $show->field('parent_id');
            $show->field('platform.name');
            $show->field('name');
            $show->field('title');
            $show->field('desc');
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
        return Form::make(new AdvertPosition(), function (Form $form) {
            $form->select('platform_id', trans('feedback.fields.platform_name'))
                ->options(PlatformModels::pluck('name','id'))
                ->default(0)->required();
            $form->text('name')
                ->help('栏目ID+标识，须唯一值，仅支持英文与下划组"_"组成')
                ->required()
                ->creationRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:advert_position,title,null,null"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('advert-position.validation.unique.name')
                    ]
                )
                ->updateRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:advert_position,title,{{id}},id}"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('advert-position.validation.unique.name')
                    ]
                );
            $form->text('title')->required();
            $form->text('desc');
            $form->number('order')->default(0);

            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
