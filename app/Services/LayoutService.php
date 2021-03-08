<?php
/**
 * LayoutService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 4:58 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;

use App\Models\AdvertData;
use App\Models\Application;
use App\Models\Content;
use App\Models\Layout;
use App\Models\Notice;
use Illuminate\Support\Facades\Cache;

class LayoutService
{
    public function getByChannelId($channel_id)
    {
        $key = "dmp:lyt:chl:{$channel_id}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            $layouts = Layout::where(['channel_id' => $channel_id])->get();
            $categoryService = new CategoryService();
            foreach ($layouts as $layout) {
                switch ($layout['type']) {
                    case 'app':
                        $targets = Application::whereIn('id', $layout['target_ids'])
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
                            ->whereIn('id', $layout['target_ids'])
                            ->where(['status' => 1])
                            ->orderBy('order')
                            ->get(['id', 'title', 'subtitle', 'image', 'category_id', 'type', 'appid', 'url'])
                            ->toArray();
                        foreach ($targets as &$target) {
                            $target['category'] = $categoryService->getById($target['category_id']);
                        }
                        break;
                    case 'notice':
                        $targets = Notice::whereIn('id', $layout['target_ids'])
                            ->where(['status' => 1])
                            ->get(['id', 'title', 'from', 'top'])
                            ->toArray();
                        break;
                    case 'advert':
                    default:
                        $advertService = new AdvertService();
                        $targets = $advertService->getByPositionFlags($layout['target_ids']);
                        break;
                }

                $data[$layout['name']] = $targets;
            }

            Cache::put($key, json_encode($data));

            return $data;
        }
    }
}
