<?php
/**
 * Clear
 * @Package App\Admin\Actions
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/4 9:42 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Admin\Actions;

use App\Admin\Forms;
use Dcat\Admin\Actions\Action;
use Illuminate\Support\Facades\Artisan;

class ClearCache extends Action
{
    protected $selector = '.clear-cache';

    public function handle()
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

    public function confirm()
    {
        return '确认清除缓存';
    }

    public function html()
    {
        return view('clear.cache');
    }
}
