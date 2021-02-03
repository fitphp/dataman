<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Dict extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'system_dict';

    public function setValueAttribute($value) {
        $this->attributes['value'] = json_encode($value);
    }

    public function getValueAttribute($json) {
        return json_decode($json, true);
    }
}
