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
            $grid->column('channel.title', trans('advert-position.fields.channel'));
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
            $show->field('target_ids', trans('layout.fields.target'))->as(function () {
                switch ($this->type) {
                    case 1:
                        $fields = ApplicationModels::whereIn('id', $this->target_ids)->get('title');
                        return $fields->pluck('title');
                        break;
                    case 2:
                        $fields = ContentModels::whereIn('id', $this->target_ids)->get('title');
                        return $fields->pluck('title');
                        break;
                    case 3: default:
                        $fields = NoticeModels::whereIn('id', $this->target_ids)->get('title');
                        return $fields->pluck('title');
                        break;
                }
            })->label();
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
            $form->display('id');
            $form->select('channel_id')->options(
                ChannelModels::selectOptions()
            )->default(0)->required();
            $form->text('name')
                ->help(trans('layout.help.name'))
                ->required()
                ->creationRules(
                    ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]$/', "unique:layout"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                )
                ->updateRules(
                    ['required', "unique:layout,name,{{id}},id"],
                    [
                        'min' => trans('admin.validation.minlength'),
                        'max' => trans('admin.validation.maxlength'),
                        'regex' => trans('admin.validation.match'),
                        'unique' => trans('admin.validation.unique')
                    ]
                );

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

            $form->disableCreatingCheck();
            $form->disableEditingCheck();
            $form->disableViewCheck();
        });
    }
}
