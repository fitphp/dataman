<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\AdvertData;
use App\Models\AdvertPosition as AdvertPositionModels;
use App\Models\Dictionary as DictionaryModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class AdvertDataController extends AdminController
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
        return Grid::make(new AdvertData(['position']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('position.name', trans('advert-data.type.name'));
            $grid->column('image');
            $grid->column('title');
            $grid->type()->using(DictionaryModel::getValueByKey('link_type'))->label();
            $grid->column('url')->link();
            $grid->column('order')->sortable();
            $grid->column('start_at');
            $grid->column('end_at');
            $grid->status()->using($this->status)->dot($this->status_label);

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
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
        return Show::make($id, new AdvertData(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('image');
            $show->field('pin_id');
            $show->field('desc');
            $show->field('type')->using(DictionaryModel::getValueByKey('link_type'));
            $show->field('appid');
            $show->field('url');
            $show->field('status');
            $show->field('order');
            $show->field('start_at');
            $show->field('end_at');
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
        return Form::make(new AdvertData(), function (Form $form) {

            $form->column(6, function (Form $form) {
                $form->text('title')->required();
                $form->select('pin_id', trans('advert-data.type.name'))
                    ->options(AdvertPositionModels::pluck('name', 'id'))
                    ->required();
                $form->text('desc');
                $form->image('image');
            });

            $form->column(6, function (Form $form) {
                $form->radio('type')->options(
                    DictionaryModel::getValueByKey('link_type')
                )->default('h5');
                $form->text('appid');
                $form->url('url');
                $form->radio('status')->options($this->status)->default(1);
                $form->number('order')->default(0);
                $form->datetime('start_at');
                $form->datetime('end_at');
            });

            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
