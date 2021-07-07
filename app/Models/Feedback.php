<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
	use HasDateTimeFormatter;

    protected $table = 'feedback';

    public function setNameAttribute($value) {
        $this->attributes['name'] = strtolower($value);
    }

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }
}
