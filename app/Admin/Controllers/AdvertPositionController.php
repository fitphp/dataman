<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\AdvertPosition;
use App\Models\Channel as ChannelModels;
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
        return Grid::make(new AdvertPosition(['channel']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('channel.title', trans('advert-position.fields.channel'));
            $grid->column('name');
            $grid->column('flag');
            $grid->column('order');
            $grid->column('desc');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
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
        return Show::make($id, new AdvertPosition(['channel']), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('flag');
            $show->field('desc');
            $show->field('channel.title', trans('advert-position.fields.channel'));
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
            $id = $form->getKey();
            $connection = config('admin.database.connection');

            $form->select('channel_id')->options(
                ChannelModels::selectOptions()
            )->default(0)->required();
            $form->text('name')
                ->required()
                ->creationRules(['required', "unique:{$connection}.advert_position"])
                ->updateRules(['required', "unique:{$connection}.advert_position, name, $id"]);

            $form->text('flag')->required();
            $form->text('desc');
            $form->text('order')->default(0);

            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
