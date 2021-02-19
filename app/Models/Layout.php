<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Layout extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'layout';

    public function setTargetIdsAttribute($value) {
        $this->attributes['target_ids'] = trim(implode(',', $value), ',');
    }

    public function getTargetIdsAttribute($value) {
        return explode(',', $value);
    }

    public function channel()
    {
        return $this->hasOne(Channel::class, 'id', 'channel_id');
    }
}
