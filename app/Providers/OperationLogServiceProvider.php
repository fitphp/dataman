<?php
/**
 * OperationLogServiceProvider
 * @Package App\Providers
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/1/30 10:48 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Providers;

use Dcat\Admin\Extend\ServiceProvider;
use App\Http\Middleware\LogOperation;

class OperationLogServiceProvider extends ServiceProvider
{
    protected $middleware = [
        'middle' => [
            LogOperation::class,
        ],
    ];

}
