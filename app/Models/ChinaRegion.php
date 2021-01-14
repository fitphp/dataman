<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;

class ChinaRegion extends Model
{
	use HasDateTimeFormatter;

    protected $table = 'china_region';
    public $timestamps = false;

}
