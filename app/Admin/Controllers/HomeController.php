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
                $row->column(4, function (Column $column) {
                    $column->row($this->dependencies());
                });

                $row->column(8, function (Column $column) {
                    $column->row($this->environment());
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
            ['name' => '缓存驱动',   'value' => config('cache.default')],
            ['name' => '会话驱动',   'value' => config('session.driver')],
            ['name' => '队列驱动',   'value' => config('queue.default')],
            ['name' => '系统时区',   'value' => config('app.timezone')],
            ['name' => '区域设置',   'value' => config('app.locale')],
        ];

        return view('admin::dashboard.environment', compact('envs'));
    }

    public function dependencies()
    {
        $json = file_get_contents(base_path('composer.json'));

        $dependencies = json_decode($json, true)['require'];

        return view('admin::dashboard.dependencies', compact('dependencies'));
    }
}
