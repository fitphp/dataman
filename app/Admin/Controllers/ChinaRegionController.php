<?php
namespace App\Admin\Controllers;

use App\Admin\Repositories\ChinaRegion;
use App\Models\DictType as DictTypeModel;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class ChinaRegionController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new ChinaRegion(), function (Grid $grid) {
            $grid->column('area_code', trans('china-region.fields.area_code'));
            $grid->column('parent_code', trans('china-region.fields.parent_code'));
            $grid->level()->using(DictTypeModel::getDataItemByTypeKey('china_region_level')
                ->pluck('value','key')->toArray())->sortable();
            $grid->column('zip_code', trans('china-region.fields.zip_code'));
            $grid->column('city_code', trans('china-region.fields.city_code'));
            $grid->column('name', trans('china-region.fields.name'));
            $grid->column('short_name', trans('china-region.fields.short_name'));
            $grid->column('pinyin', trans('china-region.fields.pinyin'));
            $grid->column('lng', trans('china-region.fields.lng'));
            $grid->column('lat', trans('china-region.fields.lat'));

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('area_code', trans('china-region.fields.area_code'));
                $filter->equal('parent_code', trans('china-region.fields.parent_code'));
                $filter->like('name', trans('china-region.fields.name'));
                $filter->equal('zip_code', trans('china-region.fields.zip_code'));
                $filter->equal('city_code', trans('china-region.fields.city_code'));
                $filter->like('pinyin', trans('china-region.fields.pinyin'));
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
            $show->field('id', 'ID');
            $show->field('level', trans('china-region.fields.level'));
            $show->field('parent_code', trans('china-region.fields.parent_code'));
            $show->field('area_code', trans('china-region.fields.area_code'));
            $show->field('zip_code', trans('china-region.fields.zip_code'));
            $show->field('city_code', trans('china-region.fields.city_code'));
            $show->field('name', trans('china-region.fields.name'));
            $show->field('short_name', trans('china-region.fields.short_name'));
            $show->field('merger_name', trans('china-region.fields.merger_name'));
            $show->field('pinyin', trans('china-region.fields.lat'));
            $show->field('lng', trans('china-region.fields.lng'));
            $show->field('lat', trans('china-region.fields.lat'));
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
            $form->display('id', 'ID');
            $form->select('level', trans('china-region.fields.level'))
                ->options(DictTypeModel::getDataItemByTypeKey('china_region_level')
                    ->pluck('value','key')->toArray())
                ->required();
            $form->text('area_code', trans('china-region.fields.area_code'))
                ->required();
            $form->text('parent_code', trans('china-region.fields.parent_code'))->default(0);
            $form->text('zip_code', trans('china-region.fields.zip_code'));
            $form->text('city_code', trans('china-region.fields.city_code'));
            $form->text('name', trans('china-region.fields.name'))->required();
            $form->text('short_name', trans('china-region.fields.short_name'));
            $form->text('merger_name', trans('china-region.fields.merger_name'));
            $form->text('pinyin', trans('china-region.fields.pinyin'));
            $form->text('lng', trans('china-region.fields.lng'));
            $form->text('lat', trans('china-region.fields.lat'));
        });
    }
}
