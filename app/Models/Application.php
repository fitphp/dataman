<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'application';

    public function setCategoryIdsAttribute($category_ids)
    {
        $this->attributes['category_ids'] = trim(implode(',', $category_ids), ',');
    }

    public function Category()
    {
        return $this->belongsTo(Category::class, 'category_ids', 'id');
    }
}
