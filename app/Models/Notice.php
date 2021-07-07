<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class Notice extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'system_notice';

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }
}
