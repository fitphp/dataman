<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Content extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'content';

    public function category()
    {
        return $this->hasOne(Category::class, 'id', 'category_id');
    }
}
