<?php
/**
 * LayoutController
 * @Package App\Http\Controllers
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 12:17 上午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Http\Controllers;

use App\Services\AdvertService;
use App\Services\ChannelService;
use App\Services\LayoutService;
use App\Services\PlatformService;

class LayoutController extends Controller
{
    public function show()
    {
        $channel_name = request()->get('channel_name');
        if (empty($channel_name)) {
            return $this->failed(404, '缺少频道名称参数');
        }

        $app_id = request()->get('app_id');
        if (empty($app_id)) {
            return $this->failed(404, '缺少AppID参数');
        }

        // 获取平台ID
        $platformService = new PlatformService();
        $platform = $platformService->getByAppId($app_id);
        if (empty($platform)) {
            return $this->failed(404, '无对应平台');
        }

        // 获取频道详情
        $channelService = new ChannelService();
        $data = $channelService->getByNameAndPlatformId($platform['id'], $channel_name);

        // 获取广告列表
        $advertService= new AdvertService();
        $data['advert'] = $advertService->getByChannelId($data['id']);

        // 获取布局列表
        $layoutService = new LayoutService();
        $data['layout'] = $layoutService->getByChannelId($data['id']);

        return $this->success($data);
    }
}
