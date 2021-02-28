<?php
/**
 * ChinaRegionService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 10:34 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;


use App\Models\ChinaRegion;
use Illuminate\Support\Facades\Cache;

class ChinaRegionService
{
    public function getByParentCode($parent_code = 0)
    {
        $key = "dmp:cn:region:pid:{$parent_code}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            $data = ChinaRegion::where([
                'parent_code' => $parent_code
            ])->get(['id', 'level', 'area_code', 'zip_code', 'city_code',
                'name', 'short_name', 'merger_name', 'pinyin'])
                ->toArray();

            Cache::put($key, json_encode($data));

            return $data;
        }
    }
}
