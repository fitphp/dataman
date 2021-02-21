<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class Channel extends Model
{
    use ModelTree;
    use HasDateTimeFormatter;
    protected $table = 'channel';

    public function setNameAttribute($value) {
        $this->attributes['name'] = strtolower($value);
    }

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }
}
