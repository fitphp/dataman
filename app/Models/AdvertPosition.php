<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class AdvertPosition extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'advert_position';

    public function setTitleAttribute($value) {
        $this->attributes['title'] = strtolower($value);
    }

    public function data()
    {
        return $this->belongsTo(AdvertData::class, 'id', 'pin_id');
    }

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }
}
