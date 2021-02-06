<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Config extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'system_config';

    public function setValueAttribute($value) {
        if ('dict' == $this->attributes['group']) {
            $this->attributes['value'] = json_encode($value);
        } else {
            $this->attributes['value'] = $value;
        }
    }

    public function getValueAttribute($value) {
        if ('dict' == $this->attributes['group']) {
            return json_decode($value, true);
        } else {
            return $value;
        }
    }

    public static function getValueByKey($key = null) {
        return self::where('status', 1)
            ->where('key', $key)
            ->first()->value;
    }
}
