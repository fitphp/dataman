<?php
/**
 * AdvertService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 4:50 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;


use App\Models\AdvertData;
use App\Models\AdvertPosition;
use Illuminate\Support\Facades\Cache;

class AdvertService
{
    public function getByChannelId($channel_id)
    {
        $key = "dmp:ad:chl:{$channel_id}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            $positions = AdvertPosition::where(['channel_id' => $channel_id])
                ->orderBy('order')
                ->get(['id', 'name', 'flag', 'desc'])
                ->toArray();
            foreach ($positions as $position) {
                $items = AdvertData::where(['pin_id' => $position['id']])
                    ->get()
                    ->toArray();
                $advert[$position['flag']] = $position;
                $advert[$position['flag']]['items'] = $items;
            }

            Cache::put($key, json_encode($advert));

            return $advert;
        }
    }
}
