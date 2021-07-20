<?php
/**
 * ChannelService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 4:41 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;


use App\Models\Application;
use App\Models\Channel;
use App\Models\Content;
use App\Models\Notice;
use Illuminate\Support\Facades\Cache;

class ChannelService
{
    public function getByNameAndPlatformId($platform_id, $name)
    {
        $key = "dmp:chl:{$platform_id}:{$name}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            $data = Channel::where([
                'name' => $name,
                'platform_id' => $platform_id
            ])->firstOrFail(['id','name','title','image'])->toArray();

            Cache::put($key, json_encode($data));

            return $data;
        }
    }

    public function getByChannelId($channel_id)
    {
        $key = "dmp:chl:{$channel_id}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            $channels = Channel::where(['channel_id' => $channel_id])->get();
            $categoryService = new CategoryService();
            foreach ($channels as $channel) {
                switch ($channel['type']) {
                    case 'app':
                        $targets = Application::whereIn('id', $channel['target_ids'])
                            ->where(['status' => 1])
                            ->orderBy('order')
                            ->get(['id', 'title', 'subtitle', 'image', 'category_ids', 'type', 'appid', 'url', 'remark'])
                            ->toArray();
                        foreach ($targets as &$target) {
                            $target['categories'] = $categoryService->getByIds($target['category_ids']);
                        }
                        break;
                    case 'content':
                        $targets = Content::with(['category'])
                            ->whereIn('id', $channel['target_ids'])
                            ->where(['status' => 1])
                            ->orderBy('order')
                            ->get(['id', 'title', 'subtitle', 'image', 'category_id', 'type', 'appid', 'url'])
                            ->toArray();
                        foreach ($targets as &$target) {
                            $target['category'] = $categoryService->getById($target['category_id']);
                        }
                        break;
                    case 'notice':
                        $targets = Notice::whereIn('id', $channel['target_ids'])
                            ->where(['status' => 1])
                            ->get(['id', 'title', 'from', 'top'])
                            ->toArray();
                        break;
                    case 'advert':
                    default:
                        $advertService = new AdvertService();
                        $targets = $advertService->getByPositionFlags($channel['target_ids']);
                        break;
                }

                $data[$channel['name']] = $targets;
            }

            Cache::put($key, json_encode($data));

            return $data;
        }
    }
}
