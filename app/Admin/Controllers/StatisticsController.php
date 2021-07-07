<?php
/**
 * StatisticsController
 * @Package App\Admin\Controllers
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/7/8 12:23 上午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Dcat\Admin\Layout\Column;
use Dcat\Admin\Layout\Content;
use Dcat\Admin\Layout\Row;

class StatisticsController extends Controller
{
    public function index(Content $content) {
        return $content
            ->header(trans('statistics.title'))
            ->description(trans('statistics.description'))
            ->body(function (Row $row) {
                $row->column(12, function (Column $column) {
                    $column->row(view('statistics.visit'));
                });
            });
    }
}
