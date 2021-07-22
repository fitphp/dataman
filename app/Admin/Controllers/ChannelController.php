<?php

namespace App\Admin\Controllers;

use App\Models\Application as ApplicationModels;
use App\Models\Channel as Models;
use App\Models\Content as ContentModels;
use App\Models\Category as CategoryModels;
use App\Models\Platform as PlatformModels;
use App\Admin\Repositories\Channel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ChannelController extends AdminController
{
    protected $type = ['index' => '目录', 'app' => '应用', 'content' => '内容', 'category' => '分类'];
    protected $type_label = ['index' => 'default', 'app' => 'primary', 'content' => 'success', 'category' => 'info'];
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
            $grid->column('id');
            $grid->column('platform.name', trans('channel.fields.platform_name'));
            $grid->column('image');
            $grid->column('name');
            $grid->column('title')->tree();
            $grid->column('type')->using($this->type)->label($this->type_label);
            $grid->column('order')->orderable();
            $grid->column('updated_at');

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
            $show->field('platform.name', trans('channel.fields.platform_id'));
            $show->field('name');
            $show->field('title');
            $show->field('subtitle');
            $show->field('image');
            $show->field('type')->using($this->type);
            $show->field('target_ids', trans('channel.fields.target'))->as(function () {
                switch ($this->type) {
                    case 'app':
                        $collection = ApplicationModels::whereIn('id', $this->target_ids)->pluck('title');
                        break;
                    case 'content':
                        $collection = ContentModels::whereIn('id', $this->target_ids)->pluck('title');
                        break;
                    case 'category':
                        $collection = CategoryModels::whereIn('id', $this->target_ids)->pluck('title');
                        break;
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
            $form->column(5, function (Form $form) {
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
                            'min' => trans('最少需要4字符'),
                            'max' => trans('最多支持32位字符'),
                            'regex' => trans('不符合命名规则'),
                            'unique' => trans('所属平台已存在该名称')
                        ]
                    )
                    ->updateRules(
                        ['required', 'min:4', 'max:32', 'regex:/^[a-zA-Z_]+$/', "unique:channel,name,{{id}},id"],
                        [
                            'min' => trans('最少需要4字节'),
                            'max' => trans('最多支持32位字符'),
                            'regex' => trans('不符合命名规则'),
                            'unique' => trans('所属平台已存在该名称'),
                        ]
                    );

                $form->text('title', trans('channel.fields.title'))->required();
                $form->text('subtitle');
                $form->text('remark');

                $form->number('order', trans('channel.fields.order'))
                    ->default(0)->required();

                $form->radio('status')
                    ->options($this->status)
                    ->default(1);
            });

            $form->column(7, function (Form $form) {
                $form->radio('type')
                    ->when('app', function (Form $form) {
                        $form->listbox('target_ids', '应用')
                            ->options(ApplicationModels::pluck('title', 'id'));
                    })
                    ->when('content', function (Form $form) {
                        $form->listbox('target_ids', '内容')
                            ->options(ContentModels::pluck('title', 'id'));
                    })
                    ->when('category', function (Form $form) {
                        $form->select('target_ids', '分类')
                            ->options(CategoryModels::pluck('title', 'id'))
                            ->default(0);
                    })
                    ->options($this->type)
                    ->default('index');

                $form->image('image', trans('channel.fields.image'));
            });

            $form->disableListButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
