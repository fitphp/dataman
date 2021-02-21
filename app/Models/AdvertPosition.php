<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class AdvertPosition extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'advert_position';

    public function setFlagAttribute($value) {
        $this->attributes['flag'] = strtolower($value);
    }

    public function channel()
    {
        return $this->hasOne(Channel::class, 'id', 'channel_id');
    }
}
