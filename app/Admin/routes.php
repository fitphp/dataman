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

    $router->resource('/dict', 'DictController'); // 字典
    $router->resource('/layout', 'LayoutController'); // 布局
    $router->resource('/notice', 'NoticeController'); // 通知
    $router->resource('/config', 'ConfigController'); // 配置
    $router->resource('/channel', 'ChannelController');  // 栏目
    $router->resource('/platform', 'PlatformController');
    $router->resource('/category', 'CategoryController');
    $router->resource('/content', 'ContentController');
    $router->resource('/region', 'ChinaRegionController');
    $router->resource('/dict/type', 'DictTypeController');
    $router->resource('/dict/data', 'DictDataController');
    $router->resource('/advert/pin', 'AdvertPinController');
    $router->resource('/advert/data', 'AdvertDataController');
    $router->resource('/application', 'ApplicationController');
});
