<?php

use Dcat\Admin\Admin;
use Dcat\Admin\Grid;
use Dcat\Admin\Form;
use Dcat\Admin\Grid\Filter;
use Dcat\Admin\Show;

/**
 * Dcat-admin - admin builder based on Laravel.
 * @author jqh <https://github.com/jqhph>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 *
 * extend custom field:
 * Dcat\Admin\Form::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Column::extend('php', PHPEditor::class);
 * Dcat\Admin\Grid\Filter::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */
use Dcat\Admin\Form\Field\Editor;

Editor::resolving(function (Editor $editor) {
    // 设置默认配置
    $editor->options([
        'toolbar'=> 'styleselect | fontsizeselect bold italic blockquote | link image | bullist numlist code removeformat ',   // 配置工具栏
        //'plugins'=> 'advlist autolink link image lists preview code help fullscreen table autoresize ',   // 插件
    ]);

    // 设置编辑器图片默认上传到七牛云
    //$editor->disk('qiniu');
});
