<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChinaRegion extends Model
{
    protected $table = 'china_region';
    public $timestamps = false;

    public function __construct(array $attributes = [])
    {
        $this->connection = config('database.connection') ?: config('database.default');

        parent::__construct($attributes);
    }
}
