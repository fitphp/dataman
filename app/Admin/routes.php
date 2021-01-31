<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->get('auth/log', 'LogController@index')->name('auth.log.index');
    $router->delete('auth/log/{id}', 'LogController@destroy')->name('auth.log.destroy');

    $router->resource('/system/config', 'SystemConfigController');
    $router->resource('/platform', 'PlatformController');
    $router->resource('/category', 'CategoryController');
    $router->resource('/region', 'ChinaRegionController');
    $router->resource('/channel', 'ChannelController');
});
