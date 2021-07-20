<?php

namespace App\Admin\Controllers;

use App\Models\AdvertPosition as AdvertPositionModels;
use App\Models\Application as ApplicationModels;
use App\Models\Channel as Models;
use App\Models\Content as ContentModels;
use App\Models\Notice as NoticeModels;
use App\Models\Platform as PlatformModels;
use App\Admin\Repositories\Channel;
use App\Services\AdvertService;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ChannelController extends AdminController
{
    protected $type = ['app' => '应用', 'content' => '内容', 'notice' => '通知', 'advert' => '广告'];
    protected $type_label = [ 'app' => 'success', 'content' => 'info', 'notice' => 'primary', 'advert' => 'default'];
    protected $status = [0 => '关闭', 1 => '正常'];
    protected $status_label = [0 => 'danger', 1 => 'success'];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Channel(['platform']), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('parent_id');
            $grid->column('platform.name', trans('channel.fields.platform_name'));
            $grid->column('name');
            $grid->column('title');
            $grid->column('subtitle');
            $grid->column('image');
            $grid->column('order');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->equal('platform_id')
                    ->select(PlatformModels::pluck('name','id'));
                $filter->equal('type')->select($this->type);
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
        return Show::make($id, new Channel(['platform']), function (Show $show) {
            $show->field('id');
            $show->field('parent_id');
            $show->field('platform.name');
            $show->field('name');
            $show->field('title');
            $show->field('subtitle');
            $show->field('image');
            $show->field('type')->using($this->type);
            $show->field('target_ids', trans('layout.fields.target'))->as(function () {
                switch ($this->type) {
                    case 'app':
                        $collection = ApplicationModels::whereIn('id', $this->target_ids)->pluck('title');
                        break;
                    case 'content':
                        $collection = ContentModels::whereIn('id', $this->target_ids)->pluck('title');
                        break;
                    case 'notice':
                        $collection = NoticeModels::whereIn('id', $this->target_ids)->pluck('title');
                        break;
                    case 'advert':
                        $advertService = new AdvertService();

                        $advert = [];
                        array_map(function ($value) use (&$advert) {
                            $advert = array_merge($advert, array_values($value));
                        }, $advertService->getByPositionFlags($this->target_ids, false));

                        $collection = collect($advert)->pluck('title');
                    default:
                }

                return $collection;
            })->label();
            $show->status()->using($this->status);
            $show->field('remark');
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
        return Form::make(new Channel(), function (Form $form) {
            $form->column(6, function (Form $form) {
                $form->select('platform_id', trans('channel.fields.platform_id'))
                    ->options(PlatformModels::pluck('name','id'))
                    ->default(0)->required();
                $form->select('parent_id', trans('channel.fields.parent_id'))
                    ->options(Models::selectOptions())->default(0)->required();
                $form->text('name', trans('channel.fields.name'))
                    ->help('必须为唯一值，仅支持英文与下划线"_"组成')
                    ->required()
                    ->creationRules(
                        ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:channel"],
                        [
                            'min' => trans('admin.validation.minlength'),
                            'max' => trans('admin.validation.maxlength'),
                            'regex' => trans('admin.validation.match'),
                            'unique' => trans('admin.validation.unique')
                        ]
                    )
                    ->updateRules(
                        ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:channel,name,{{id}},id"],
                        [
                            'min' => trans('admin.validation.minlength'),
                            'max' => trans('admin.validation.maxlength'),
                            'regex' => trans('admin.validation.match'),
                            'unique' => trans('admin.validation.unique'),
                        ]
                    );

                $form->text('title', trans('channel.fields.title'))->required();
                $form->text('subtitle');
                $form->text('remark');
            });

            $form->column(6, function (Form $form) {
                $form->radio('type')
                    ->when('app', function (Form $form) {
                        $form->listbox('target_ids', '应用')
                            ->options(ApplicationModels::pluck('title', 'id'));
                    })
                    ->when('content', function (Form $form) {
                        $form->listbox('target_ids', '内容')
                            ->options(ContentModels::pluck('title', 'id'));
                    })
                    ->when('notice', function (Form $form) {
                        $form->listbox('target_ids', '通知')
                            ->options(NoticeModels::pluck('title', 'id'));
                    })
                    ->when('advert', function (Form $form) {
                        $form->listbox('target_ids', '广告位')
                            ->options(AdvertPositionModels::pluck('name', 'title'));
                    })
                    ->options($this->type)
                    ->default(0);

                $form->image('image', trans('channel.fields.image'));

                $form->radio('status')
                    ->options($this->status)
                    ->default(1);

                $form->number('order', trans('channel.fields.order'))
                    ->default(0)->required();
            });

            $form->disableListButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
