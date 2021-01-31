<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class DictData extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'dict_data';

    public function type()
    {
        return $this->belongsTo(DictType::class);
    }
}
