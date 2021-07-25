<?php
/**
 * ContentService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/7/25 4:20 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;


use App\Models\Content;

class ContentService
{
    public function getByTargetIds($ids)
    {
        $targets = Content::with(['category'])
            ->whereIn('id', $ids)
            ->where(['status' => 1])
            ->orderBy('order')
            ->get(['id', 'title', 'subtitle', 'image', 'category_id', 'type', 'appid', 'url'])
            ->toArray();

        return $targets;
    }

    public function getByCategoryId($category_id)
    {
        $targets = Content::with(['category'])
            ->where(['status' => 1, 'category_id' => $category_id])
            ->get(['id', 'title', 'subtitle', 'image', 'category_id', 'type', 'appid', 'url'])
            ->toArray();

        return $targets;
    }
}
