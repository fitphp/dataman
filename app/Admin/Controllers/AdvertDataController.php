<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\AdvertData;
use App\Models\AdvertPin as AdvertPinModels;
use App\Models\DictType as DictTypeModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class AdvertDataController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new AdvertData(['pin']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('image');
            $grid->column('title');
            $grid->column('pin.name', trans('advert-data.type.name'));
            $grid->type()->using(DictTypeModel::getDataItemByTypeKey('link_type')
                ->pluck('value','key')->toArray());
            $grid->column('url');
            $grid->status()->using([0 => '关闭', 1 => '正常'])->label([ 0 => 'danger', 1 => 'primary']);
            $grid->column('order');
            $grid->column('start_at');
            $grid->column('end_at')->sortable();

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
            $show->field('type');
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
                    ->options(AdvertPinModels::all()->pluck('name', 'id'))
                    ->required();
                $form->text('desc');
                $form->image('image');
            });

            $form->column(6, function (Form $form) {
                $form->radio('type')->options(
                    DictTypeModel::getDataItemByTypeKey('link_type')
                    ->pluck('value','key')->toArray()
                )->default('h5');
                $form->url('url');
                $form->radio('status')->options([0 => '停用', 1 => '正常'])->default(1);
                $form->text('order')->default(0);
                $form->datetime('start_at');
                $form->datetime('end_at');
            });
        });
    }
}
