<?php
/**
 * SettingConfig
 * @Package App\Admin\Actions
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/3/20 11:09 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Admin\Actions;

use App\Admin\Forms\SettingConfig as SettingConfigFrom;
use Dcat\Admin\Actions\Action;
use Dcat\Admin\Widgets\Modal;

class SettingConfig extends Action
{
    public function render()
    {
        $modal = Modal::make()
            ->id('setting-config') // 导航栏显示弹窗，必须固定ID，随机ID会在刷新后失败
            ->title('设置配置')
            ->body(SettingConfigFrom::make())
            ->lg()
            ->button(view('setting.config'));

        return $modal->render();
    }
}
