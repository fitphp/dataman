<?php
/**
 * ApplicationTable
 * @Package App\Admin\Renderable
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/7/26 11:39 上午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Admin\Renderable;

use App\Models\Application as ApplicationModels;
use App\Models\Category as CategoryModels;
use App\Models\Dictionary as DictionaryModel;
use Dcat\Admin\Grid;
use Dcat\Admin\Grid\LazyRenderable;

class ApplicationTable extends LazyRenderable
{
    public function grid(): Grid
    {
        return Grid::make(new ApplicationModels(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('platform.name', trans('application.fields.platform_name'));
            $grid->column('auth')->using(
                DictionaryModel::getValueByKey('auth_level')
            )->label();

            $grid->column('category_ids', trans('application.category.title'))
                ->display(function ($category_ids) {
                    return CategoryModels::whereIn('id', $category_ids)->pluck('title');
                })->label();

            $grid->column('title');
            $grid->column('type')->using(
                DictionaryModel::getValueByKey('link_type')
            )->label();

            $grid->quickSearch(['id', 'title']);

            $grid->paginate(10);
            $grid->disableActions();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');
                $filter->like('title');
                $filter->equal('category_id', trans('content.category.title'))->select(
                    CategoryModels::selectOptions()
                );
                $filter->equal('type')->select(
                    DictionaryModel::getValueByKey('link_type')
                );
                $filter->like('url');
                $filter->equal('status')->select($this->status);
            });
        });
    }
}
