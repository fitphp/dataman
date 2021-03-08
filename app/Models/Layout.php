<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Layout extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'layout';

    public function setNameAttribute($value) {
        $this->attributes['name'] = strtolower($value);
    }

    public function setTargetIdsAttribute($value) {
        if (is_array($value)) {
            $this->attributes['target_ids'] = trim(implode(',', $value), ',');
        } else {
            $this->attributes['target_ids'] = $value;
        }
    }

    public function getTargetIdsAttribute($value) {
        return explode(',', $value);
    }

    public function channel()
    {
        return $this->hasOne(Channel::class, 'id', 'channel_id');
    }
}
