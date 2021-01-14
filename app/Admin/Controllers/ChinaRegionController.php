<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\ChinaRegion;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ChinaRegionController extends AdminController
{
    protected $title = '中国地区';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new ChinaRegion(), function (Grid $grid) {
            $grid->column('area_code')->sortable();
            $grid->column('parent_code');
            $grid->column('level');
            $grid->column('zip_code');
            $grid->column('city_code');
            $grid->column('name');
            $grid->column('short_name');
            $grid->column('pinyin');
            $grid->column('lng');
            $grid->column('lat');

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('area_code');
                $filter->equal('parent_code');
                $filter->like('name');
                $filter->equal('zip_code');
                $filter->equal('city_code');
                $filter->like('pinyin');
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
        return Show::make($id, new ChinaRegion(), function (Show $show) {
            $show->field('id');
            $show->field('level');
            $show->field('parent_code');
            $show->field('area_code');
            $show->field('zip_code');
            $show->field('city_code');
            $show->field('name');
            $show->field('short_name');
            $show->field('merger_name');
            $show->field('pinyin');
            $show->field('lng');
            $show->field('lat');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new ChinaRegion(), function (Form $form) {
            $form->display('id');
            $form->text('level');
            $form->text('parent_code');
            $form->text('area_code');
            $form->text('zip_code');
            $form->text('city_code');
            $form->text('name');
            $form->text('short_name');
            $form->text('merger_name');
            $form->text('pinyin');
            $form->text('lng');
            $form->text('lat');
        });
    }
}
