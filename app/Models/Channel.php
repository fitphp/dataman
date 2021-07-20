<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;
use Dcat\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Spatie\EloquentSortable\Sortable;

class Channel extends Model implements Sortable
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

    public function setTargetIdsAttribute($value) {
        if (is_array($value)) {
            $this->attributes['target_ids'] = trim(implode(',', $value), ',');
        } else {
            $this->attributes['target_ids'] = $value;
        }
    }

    public function getTargetIdsAttribute($value) {
        return explode(',', $value);
    }
}
