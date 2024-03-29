<?php
/**
 * Category
 * @Package App\Models
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/1/23 9:18 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */
namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Spatie\EloquentSortable\Sortable;

class Category extends Model implements Sortable
{
    use ModelTree;
    use HasDateTimeFormatter;
    protected $table = 'category';

    public function setNameAttribute($value) {
        $this->attributes['name'] = strtolower($value);
    }

    public static function getByGroup($group = 'application') {
        return self::where('group', $group)->pluck('title', 'id');
    }
}
