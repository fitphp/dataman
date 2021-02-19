<?php
/**
 * Clear
 * @Package App\Admin\Forms
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/4 9:44 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Admin\Forms;

use Exception;
use Dcat\Admin\Widgets\Form;
use Dcat\Admin\Http\JsonResponse;
use Illuminate\Support\Facades\Artisan;

class ClearCacheForm extends Form
{
    // 处理请求
    public function handle(array $input) : JsonResponse
    {
        try {
            Artisan::call('cache:clear');
            return $this->response()
                ->success('清理成功');
        } catch (Exception $e) {
            return $this->response()
                ->error($e->getMessage());
        }
    }

    /**
     * 构造表单
     */
    public function form()
    {

    }
}
