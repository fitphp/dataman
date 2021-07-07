<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'content';

    public function category()
    {
        return $this->hasOne(Category::class, 'id', 'category_id');
    }

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }
}
