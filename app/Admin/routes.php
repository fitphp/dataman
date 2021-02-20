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
    $router->resource('/layout', 'LayoutController'); // 布局
    $router->resource('/notice', 'NoticeController'); // 通知
    $router->resource('/channel', 'ChannelController');  // 栏目
    $router->resource('/platform', 'PlatformController'); // 平台
    $router->resource('/category', 'CategoryController'); // 分类
    $router->resource('/content', 'ContentController'); // 内容
    $router->resource('/dictionary', 'DictionaryController'); // 字典
    $router->resource('/region/china', 'ChinaRegionController'); // 中国区域
    $router->resource('/advert/position', 'AdvertPositionController'); // 广告位置
    $router->resource('/advert/data', 'AdvertDataController'); // 广告数据
    $router->resource('/application', 'ApplicationController'); // 应用

    $router->get('/media', 'MediaController@index')->name('media.index');
    $router->get('/media/download', 'MediaController@download')->name('media.download');
    $router->delete('/media/delete', 'MediaController@delete')->name('media.delete');
    $router->put('/media/move', 'MediaController@move')->name('media.move');
    $router->post('/media/upload', 'MediaController@upload')->name('media.upload');
    $router->post('/media/folder', 'MediaController@newFolder')->name('media.new.folder');
});
