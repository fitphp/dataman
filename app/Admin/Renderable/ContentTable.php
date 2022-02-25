<?php
/**
 * ContentTable
 * @Package App\Admin\Renderable
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/7/26 11:47 上午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Admin\Renderable;

use App\Models\Category as CategoryModels;
use App\Models\Content as ContentModels;
use App\Models\Dictionary as DictionaryModel;
use Dcat\Admin\Grid;
use Dcat\Admin\Grid\LazyRenderable;

class ContentTable extends LazyRenderable
{
    public function grid(): Grid
    {
        return Grid::make(new ContentModels(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('platform.name', trans('content.fields.platform_name'));
            $grid->column('category.title', trans('content.category.title'))->label();
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
