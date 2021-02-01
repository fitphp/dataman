<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class AdvertPin extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'advert_pin';

    public function channel()
    {
        return $this->hasOne(Channel::class, 'id', 'channel_id');
    }
}
