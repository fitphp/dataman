<?php
/**
 * ChannelController
 * @Package App\Http\Controllers
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/7/25 3:49 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Http\Controllers;


use App\Services\ApplicationService;
use App\Services\CategoryService;
use App\Services\ChannelService;
use App\Services\ContentService;
use App\Services\PlatformService;

class ChannelController extends Controller
{
    public function layout()
    {
        $app_id = request()->get('app_id');
        if (empty($app_id)) {
            return $this->failed(404, '缺少AppID参数');
        }

        $channel_name = request()->get('channel_name');
        if (empty($channel_name)) {
            return $this->failed(404, '缺少频道名称参数');
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
        if (empty($data)) {
            return $this->failed(404, '无对应频道');
        }

        // 获取布局子数据列表
        $channels = $channelService->getByParentChannelId($data['id']);

        $appService = new ApplicationService();
        $contentService = new ContentService();
        $categoryService = new CategoryService();

        foreach ($channels as $channel) {
            switch ($channel['type']) {
                case 'app':
                    $targets = $appService->getByTargetIds($channel['target_ids']);
                    break;
                case 'content':
                    $targets = $contentService->getByTargetIds($channel['target_ids']);
                    break;
                case 'category':
                    $category = $categoryService->getById($channel['target_ids'][0]);
                    if($category['group'] == 'application') {
                        $targets = $appService->getByCategoryIds($category['id']);
                    } elseif($category['group'] == 'content') {
                        $targets = $contentService->getByCategoryId($category['id']);
                    }
                    break;
            }

            $data[$channel['name']] = $targets;
        }

        return $this->success($data);
    }
}
