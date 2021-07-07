<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Feedback;
use App\Models\Dictionary as DictionaryModel;
use App\Models\Platform as PlatformModels;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class FeedbackController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Feedback(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('platform.name', trans('feedback.fields.platform_name'));
            $grid->column('type')->using(
                DictionaryModel::getValueByKey('feedback_type')
            )->label();;
            $grid->column('content');
            $grid->column('contact');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->equal('platform_id')
                    ->select(PlatformModels::pluck('name','id'));

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
        return Show::make($id, new Feedback(), function (Show $show) {
            $show->field('id');
            $show->field('parent_id');
            $show->field('platform.name');
            $show->field('type')->using(
                DictionaryModel::getValueByKey('feedback_type')
            );;
            $show->field('content');
            $show->field('contact');
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
        return Form::make(new Feedback(), function (Form $form) {
            $form->display('id');
            $form->select('platform_id', trans('feedback.fields.platform_id'))
                ->options(PlatformModels::pluck('name','id'))
                ->default(0)->required();
            $form->select('type')->options(
                DictionaryModel::getValueByKey('feedback_type')
            );
            $form->text('content');
            $form->text('contact');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
