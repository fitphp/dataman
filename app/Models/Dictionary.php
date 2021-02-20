<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Dictionary extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'dictionary';

    public function setValueAttribute($value) {
        $value = array_filter($value);
        $this->attributes['value'] = json_encode($value);
    }

    public function getValueAttribute($value) {
        return json_decode($value, true);
    }

    public static function getValueByKey($key = null) {
        return self::where('status', 1)
            ->where('key', $key)
            ->first()->value;
    }
}
