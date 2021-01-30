<?php

namespace App\Admin\Repositories;

use App\Models\Platform as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Platform extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
