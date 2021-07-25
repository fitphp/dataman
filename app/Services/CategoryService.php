<?php
/**
 * CategoryService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 6:09 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;

use App\Models\Category;
use Illuminate\Support\Facades\Cache;

class CategoryService
{
    public function getById($id)
    {
        $key = "dmp:cat:{$id}";
        if (Cache::has($key)) {
            return json_decode(Cache::get($key), true);
        } else {
            $category = Category::find($id, ['id','image','name', 'title', 'group'])
                ->toArray();

            Cache::put($key, json_encode($category));

            return $category;
        }
    }

    public function getByIds($ids)
    {
        foreach ($ids as $id) {
            $data[$id] = $this->getById($id);
        }

        return $data;
    }
}
