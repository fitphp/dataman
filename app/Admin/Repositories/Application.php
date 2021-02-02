<?php

namespace App\Admin\Repositories;

use App\Models\Application as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Application extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
