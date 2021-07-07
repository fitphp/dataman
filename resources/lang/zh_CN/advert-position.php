<?php
return [
    'labels' => [
        'AdvertPosition' => '位置管理',
        'position' => '位置管理',
    ],
    'fields' => [
        'name' => '名称',
        'platform_id' => '平台ID',
        'platform_name' => '平台名称',
        'flag' => '标识',
        'desc' => '描述',
        'channel' => '栏目',
        'channel_id' => '栏目ID',
        'order' => '排序',
    ],
    'options' => [
    ],
    'validation' => [
        'unique' => [
            'flag'    => '已有相同 :attribute 存在，相同栏目下须唯一。',
        ],
    ],
];
