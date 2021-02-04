<?php
use Dcat\Admin\Admin;
use Dcat\Admin\Form\Field\Editor;

Admin::disablePjax();

Editor::resolving(function (Editor $editor) {
    // 设置默认配置
    $editor->options([
        'toolbar'=> 'styleselect | fontsizeselect bold italic blockquote | link image | bullist numlist code removeformat ',   // 配置工具栏
        //'plugins'=> 'advlist autolink link image lists preview code help fullscreen table autoresize ',   // 插件
    ]);
});
