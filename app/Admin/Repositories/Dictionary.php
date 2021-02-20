<?php

namespace App\Admin\Repositories;

use App\Models\Dictionary as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Dictionary extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
