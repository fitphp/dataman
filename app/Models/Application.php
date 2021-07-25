<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'application';

    public function setCategoryIdsAttribute($value)
    {
        $this->attributes['category_ids'] = trim(implode(',', $value), ',');
    }

    public function getCategoryIdsAttribute($value)
    {
        return explode(',', $value);
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_ids', 'id');
    }

    public function platform()
    {
        return $this->belongsTo(Platform::class);
    }
}
