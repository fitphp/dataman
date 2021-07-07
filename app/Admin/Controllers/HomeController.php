<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Dcat\Admin\Layout\Column;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->header(trans('home.title'))
            ->description(trans('home.description'))
            ->body(function (Row $row) {
                $row->column(12, function (Column $column) {
                    $column->row($this->server());
                });

                $row->column(6, function (Column $column) {
                    $column->row($this->env());
                });

                $row->column(6, function (Column $column) {
                    $column->row($this->team());
                });
            });
    }

    public function env()
    {
        $envs = [
            ['name' => trans('home.env.php_version'),   'value' => 'PHP/'.PHP_VERSION],
            ['name' => trans('home.env.framework_version'),   'value' => 'Laravel '.app()->version()],
            ['name' => trans('home.env.soft_config'),   'value' => $_SERVER["SERVER_SOFTWARE"]],
            ['name' => trans('home.env.timezone'),   'value' => config('app.timezone')],
            ['name' => trans('home.env.region'),   'value' => config('app.locale')],
        ];

        return view('dashboard.env', compact('envs'));
    }

    public function team()
    {
        $teams = [
            ['name' => trans('home.team.pm'), 'value' => [
                'Boolean' => 'hongbin.hsu@qq.com'
            ]],
            ['name' => trans('home.team.sa'), 'value' => [
                'Boolean' => 'hongbin.hsu@qq.com'
            ]],
            ['name' => trans('home.team.dev'), 'value' => [
                'Boolean' => 'hongbin.hsu@qq.com'
            ]],
            ['name' => trans('home.team.design'), 'value' => [
                'Boolean' => 'hongbin.hsu@qq.com'
            ]],
            ['name' => trans('home.team.qa'), 'value' => [
                'Boolean' => 'hongbin.hsu@qq.com'
            ]],
        ];

        return view('dashboard.team', compact('teams'));
    }

    public function server()
    {
        $server = [
            ['name' => trans('home.server.name'), 'value' => $_SERVER['SERVER_NAME']],
            ['name' => trans('home.server.os'), 'value' => php_uname('s').' '.php_uname('r')],
            ['name' => trans('home.server.ip'), 'value' => $_SERVER['SERVER_ADDR']],
        ];

        return view('dashboard.server', compact('server'));
    }

    public function dependencies()
    {
        $json = file_get_contents(base_path('composer.json'));

        $dependencies = json_decode($json, true)['require'];

        return view('admin::dashboard.dependencies', compact('dependencies'));
    }
}
