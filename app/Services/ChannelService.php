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


use App\Models\Channel;
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
}
