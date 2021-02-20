<?php

namespace App\Admin\Repositories;

use App\Models\AdvertPosition as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class AdvertPosition extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
