<?php
use Dcat\Admin\Admin;
use Dcat\Admin\Form\Field;
use App\Admin\Actions;
use Dcat\Admin\Layout\Navbar;

Admin::navbar(function (Navbar $navbar) {
    $navbar->right(Actions\ClearCacheAction::make()->render());

});

// 关闭Pjax
//Admin::disablePjax();

Field\Editor::resolving(function (Field\Editor $editor) {
    // 设置默认配置
    $editor->options([
        'toolbar'=> 'styleselect | fontsizeselect bold italic blockquote | link image | bullist numlist code removeformat ',   // 配置工具栏
        //'plugins'=> 'advlist autolink link image lists preview code help fullscreen table autoresize ',   // 插件
    ]);
});
