<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class AdvertData extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'advert_data';

    public function pin()
    {
        return $this->hasOne(AdvertPin::class, 'id', 'pin_id');
    }
}
