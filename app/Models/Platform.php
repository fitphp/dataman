<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class Platform extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'platform';

    public function setAppIdAttribute($value) {
        $this->attributes['app_id'] = strtolower($value);
    }

    public function channel()
    {
        return $this->hasOne(Channel::class);
    }
}
