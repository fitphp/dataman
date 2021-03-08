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
    public function getByChannelId($channel_id, $cache = true)
    {
        $key = "dmp:ad:chl:{$channel_id}";
        if (Cache::has($key) && $cache) {
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

            if ($cache) {
                Cache::put($key, json_encode($advert));
            }
            return $advert;
        }
    }

    public function getByPositionFlag($flag, $cache = true)
    {
        $key = "dmp:ad:flag:{$flag}";
        if (Cache::has($key) && $cache) {
            return json_decode(Cache::get($key), true);
        } else {
            $position = AdvertPosition::where(['flag' => $flag])
                ->first(['id', 'flag'])->toArray();
            $advert = AdvertData::where(['pin_id' => $position['id']])->get()->toArray();

            if ($cache) {
                Cache::put($key, json_encode($advert));
            }

            return $advert;
        }
    }

    public function getByPositionFlags($flags, $cache = true)
    {
        $advert = [];
        foreach ($flags as $flag) {
            $advert[$flag] = $this->getByPositionFlag($flag, $cache);
        }

        return $advert;
    }
}
