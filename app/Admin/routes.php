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
    $router->resource('/platform', 'PlatformController'); // 平台
    $router->resource('/category', 'CategoryController'); // 分类
    $router->resource('/content', 'ContentController'); // 内容
    $router->resource('/region', 'ChinaRegionController'); // 中国区域
    $router->resource('/advert/pin', 'AdvertPinController'); // 广告位置
    $router->resource('/advert/data', 'AdvertDataController'); // 广告数据
    $router->resource('/application', 'ApplicationController'); // 应用
});
