<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Layout;
use App\Models\Notice as NoticeModels;
use App\Models\Content as ContentModels;
use App\Models\Channel as ChannelModels;
use App\Models\Application as ApplicationModels;

use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class LayoutController extends AdminController
{
    protected $type = [1 => '应用', 2 => '内容', 3 => '通知'];
    protected $type_label = [ 1 => 'success', 2 => 'info', 3 => 'primary'];
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Layout(['channel']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('channel.title', trans('advert-pin.fields.channel'));
            $grid->type()->using($this->type)
                ->label($this->type_label);
            $grid->column('name');
            $grid->column('title');
            $grid->column('subtitle');
            $grid->status()->using($this->status)
                ->dot([ 0 => 'danger', 1 => 'success']);
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

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
        return Show::make($id, new Layout(['channel']), function (Show $show) {
            $show->field('id');
            $show->field('channel.title', trans('layout.fields.channel'));
            $show->field('name');
            $show->field('title');
            $show->field('subtitle');
            $show->type()->using($this->type);

//            $show->field('target_ids')->as(function ($target_ids){
//                return var_dump($target_ids);
//            });

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
        return Form::make(new Layout(), function (Form $form) {
            $id = $form->getKey();
            $connection = config('admin.database.connection');

            $form->display('id');
            $form->select('channel_id')->options(
                ChannelModels::selectOptions()
            )->default(0)->required();
            $form->text('name')
                ->help('必须为唯一值，不可重复', 'fa-info-circle')
                ->required()
                ->creationRules(['required', "unique:{$connection}.layout"])
                ->updateRules(['required', "unique:{$connection}.layout, name, $id"]);

            $form->text('title');
            $form->text('subtitle');
            $form->radio('type')
                ->when(1, function (Form $form) {
                    $form->multipleSelect('target_ids', '应用')->options(
                        ApplicationModels::all()->pluck('title', 'id')
                    )->default(0);
                })
                ->when(2, function (Form $form) {
                    $form->multipleSelect('target_ids', '内容')->options(
                        ContentModels::all()->pluck('title', 'id')
                    )->default(0);
                })
                ->when(3, function (Form $form) {
                    $form->multipleSelect('target_ids', '通知')->options(
                        NoticeModels::all()->pluck('title', 'id')
                    )->default(0);
                })
                ->options($this->type)
                ->default(0);

            $form->radio('status')
                ->options($this->status)
                ->default(1);
            $form->text('remark');

            $form->display('created_at');
            $form->display('updated_at');

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
