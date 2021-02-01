<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\Category;
use App\Models\Category as Models;
use Dcat\Admin\Show;
use Dcat\Admin\Tree;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Layout\Row;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Http\Controllers\AdminController;


class CategoryController extends AdminController
{
    public function index(Content $content)
    {
        return $content->title(trans('category.title'))
            ->description(trans('admin.list'))
            ->body(function (Row $row) {
                $tree = new Tree(new Category());
                $tree->disableCreateButton();
                $tree->disableQuickCreateButton();
                $row->column(6, $tree);
                $row->column(6, $this->form());
            });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new Category(), function (Grid $grid) {
            $grid->column('parent_id', trans('category.fields.pid'))->sortable();
            $grid->column('image', trans('category.fields.image'));
            $grid->column('title', trans('category.fields.title'));
            $grid->column('name', trans('category.fields.name'));
            $grid->column('order', trans('category.fields.order'));
            $grid->column('updated_at', admin_trans('category.fields.updated_at'));

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('parent_id', trans('category.fields.parent_id'));
                $filter->like('title', trans('category.fields.title'));
                $filter->like('name', trans('category.fields.name'));
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
        return Show::make($id, new Category(), function (Show $show) {
            $show->field('id', 'ID');
            $show->field('parent_id', trans('category.fields.parent_id'));
            $show->field('image', trans('category.fields.image'));
            $show->field('title', trans('category.fields.title'));
            $show->field('name', trans('category.fields.name'));
            $show->field('order', trans('category.fields.order'));
            $show->field('created_at', admin_trans('category.fields.created_at'));
            $show->field('updated_at', admin_trans('category.fields.updated_at'));
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Category(), function (Form $form) {
            $form->display('id', 'ID');
            $form->select('parent_id', trans('category.fields.parent_id'))
                ->options(Models::selectOptions())->default(0)->required();;
            $form->image('image', trans('category.fields.image'));
            $form->text('title', trans('category.fields.title'))->required();
            $form->text('name', trans('category.fields.name'));
            $form->text('order', trans('category.fields.order'))
                ->default(0)->required();
            $form->disableListButton();
            $form->disableViewCheck();
            $form->disableEditingCheck();
            $form->disableCreatingCheck();
        });
    }
}
