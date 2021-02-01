<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\AdvertPin;
use App\Models\Channel as ChannelModels;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class AdvertPinController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new AdvertPin(['channel']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('desc');
            $grid->column('channel.title', trans('advert-pin.fields.channel'));
            $grid->column('order');
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
        return Show::make($id, new AdvertPin(['channel']), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('desc');
            $show->field('channel.title', trans('advert-pin.fields.channel'));
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
        return Form::make(new AdvertPin(), function (Form $form) {

            $form->select('channel_id')->options(
                ChannelModels::selectOptions()
            )->default(0)->required();
            $form->text('name')->required();
            $form->text('desc');
            $form->text('order')->default(0);
        });
    }
}
