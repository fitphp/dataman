<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Content;
use App\Models\Dict as DictModel;
use App\Models\Category as CategoryModels;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ContentController extends AdminController
{
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Content(['category']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('category.title', trans('content.category.title'))->label();
            $grid->column('image')->width(40);
            $grid->column('title');
            $grid->type()->using(DictModel::getValueByKey('link_type'))->label();
            $grid->column('url')->link();
            $grid->column('order')->sortable();
            $grid->status()->using($this->status)->dot($this->status_label);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title');
                $filter->equal('category_id', trans('content.category.title'))->select(
                    CategoryModels::selectOptions()
                );
                $filter->equal('type')->select(DictModel::getValueByKey('link_type'));
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
        return Show::make($id, new Content(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('subtitle');
            $show->field('category_id');
            $show->field('image');
            $show->field('content');
            $show->field('type')->using(DictModel::getValueByKey('link_type'));
            $show->field('appid');
            $show->field('url');
            $show->field('order');
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
        return Form::make(new Content(), function (Form $form) {
            $form->select('category_id')->options(
                CategoryModels::selectOptions()
            )->default(0)->required();
            $form->text('title')->required();
            $form->text('subtitle');
            $form->image('image');
            $form->radio('type')
                ->options(DictModel::getValueByKey('link_type'))
                ->default('h5')
                ->required();
            $form->text('appid');
            $form->url('url')->required();
            $form->text('order')->default(0);
            $form->radio('status')->options($this->status)->default(1);
            $form->editor('content');

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
