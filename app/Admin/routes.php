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

    $router->resource('/notice', 'NoticeController');
    $router->resource('/config', 'ConfigController');
    $router->resource('/platform', 'PlatformController');
    $router->resource('/category', 'CategoryController');
    $router->resource('/region', 'ChinaRegionController');
    $router->resource('/channel', 'ChannelController');
    $router->resource('/dict/type', 'DictTypeController');
    $router->resource('/dict/data', 'DictDataController');
    $router->resource('/advert/pin', 'AdvertPinController');
    $router->resource('/advert/data', 'AdvertDataController');
});
