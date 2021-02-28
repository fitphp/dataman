<?php
/**
 * PlatformService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 4:18 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;


use App\Models\Platform;
use Illuminate\Support\Facades\Cache;

class PlatformService
{
    public function __construct()
    {
        $lock_key = 'dmp:pf:app_id:lock';
        if (!Cache::has($lock_key)) {
            $items = Platform::where(['status' => 1])
                ->get(['id','name','app_id', 'app_secret'])
                ->toArray();
            foreach ($items as $item) {
                $key = "dmp:pf:app_id:{$item['app_id']}";
                Cache::put($key, json_encode($item));
            }

            Cache::put($lock_key, true);
        }
    }

    public function getByAppId($app_id)
    {
        $key = "dmp:pf:app_id:{$app_id}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            return [];
        }
    }
}
