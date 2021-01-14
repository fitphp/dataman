<?php

namespace App\Admin\Repositories;

use App\Models\ChinaRegion as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class ChinaRegion extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
