<?php
/**
 * ApplicationService
 * @Package App\Services
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/7/25 4:19 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Services;


use App\Models\Application;

class ApplicationService
{
    public function getByTargetIds($ids)
    {
        $categoryService = new CategoryService();
        $targets = Application::whereIn('id', $ids)
            ->where(['status' => 1])
            ->orderBy('order')
            ->get(['id', 'title', 'subtitle', 'image', 'category_ids', 'type', 'appid', 'url', 'remark'])
            ->toArray();
        foreach ($targets as &$target) {
            $target['categories'] = $categoryService->getByIds($target['category_ids']);
        }

        return $targets;
    }

    public function getByCategoryIds($category_ids)
    {
        $targets = Application::where(['status' => 1])
            ->link('category_ids', $category_ids)
            ->orderBy('order')
            ->get(['id', 'title', 'subtitle', 'image', 'category_ids', 'type', 'appid', 'url', 'remark'])
            ->toArray();

        return $targets;
    }
}
