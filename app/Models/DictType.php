<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class DictType extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'dict_type';

    public function data()
    {
        return $this->hasOne(DictData::class);
    }
}
