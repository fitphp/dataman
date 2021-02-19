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

use Dcat\Admin\Actions\Action;
use Dcat\Admin\Widgets\Modal;
use App\Admin\Forms;

class ClearCacheAction extends Action
{
    public function render()
    {
        $modal = Modal::make()
            ->id('clearCache') // 导航栏显示弹窗，必须固定ID，随机ID会在刷新后失败
            ->title('清理缓存')
            ->body(
                Forms\ClearCacheForm::make()
                    ->render()
            )
            ->button(view('navbar.clear'));

        return $modal->render();
    }
}
