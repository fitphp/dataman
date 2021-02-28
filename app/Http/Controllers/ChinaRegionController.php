<?php
/**
 * ChinaRegionController
 * @Package App\Http\Controllers
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/28 12:18 上午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Http\Controllers;

use App\Services\ChinaRegionService;

class ChinaRegionController extends Controller
{
    public function show()
    {
        $parent_code = request()->get('parent_code', 0);

        $chinaRegionService = new ChinaRegionService();
        $data = $chinaRegionService->getByParentCode($parent_code);

        return $this->success($data);
    }
}
