<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Layout extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'layout';

//    public function setTargetAttribute($value) {
//        $this->attributes['value'] = json_encode($value);
//    }

    public function channel()
    {
        return $this->hasOne(Channel::class, 'id', 'channel_id');
    }
}
