<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Dcat\Admin\Http\Controllers\Dashboard;
use Dcat\Admin\Layout\Column;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->header('控制台')
            ->description('当前系统基本信息')
            ->body(function (Row $row) {
                $row->column(6, function (Column $column) {
                    $column->row($this->environment());
                });

                $row->column(6, function (Column $column) {
                    $column->row($this->teaminfo());
                });
            });
    }

    public function environment()
    {
        $envs = [
            ['name' => 'PHP版本',   'value' => 'PHP/'.PHP_VERSION],
            ['name' => '框架版本',   'value' => 'Laravel '.app()->version()],
            ['name' => '操作系统',   'value' => php_uname()],
            ['name' => '软件配置',   'value' => $_SERVER["SERVER_SOFTWARE"]],
            ['name' => '系统时区',   'value' => config('app.timezone')],
            ['name' => '区域设置',   'value' => config('app.locale')],
        ];

        return view('dashboard.environment', compact('envs'));
    }

    public function teaminfo()
    {
        $teams = [
            ['name' => '项目管理',   'value' => ''],
            ['name' => '系统架构',   'value' => ''],
            ['name' => '产品需求',   'value' => ''],
            ['name' => '研发交付',   'value' => ''],
            ['name' => '交互设计',   'value' => ''],
            ['name' => '质量管理',   'value' => '']
        ];

        return view('dashboard.team', compact('teams'));
    }

    public function dependencies()
    {
        $json = file_get_contents(base_path('composer.json'));

        $dependencies = json_decode($json, true)['require'];

        return view('admin::dashboard.dependencies', compact('dependencies'));
    }
}
