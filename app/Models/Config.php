<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Config extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'system_config';

    public function setValueAttribute($value) {
        if ('basic' == $this->attributes['group']) {
            $this->attributes['value'] = $value;
        } else {
            $this->attributes['value'] = json_encode($value);
        }
    }

    public function getValueAttribute($value) {
        if ('basic' == $this->attributes['group']) {
            return $value;
        } else {
            return json_decode($value, true);
        }
    }

    public static function getValueByKey($key = null) {
        return self::where('status', 1)
            ->where('key', $key)
            ->first()->value;
    }
}
