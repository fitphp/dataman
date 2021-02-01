<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class DictType extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'dict_type';

    public static function getDataItemByTypeKey($key = null) {
        $result = DictType::with(['data' => function($query){
            $query->where('status', 1);
        }])->where('key', $key)->get();

        return $result->first()->data;
    }

    public function data()
    {
        return $this->hasMany(DictData::class, 'type_id', 'id');
    }
}
