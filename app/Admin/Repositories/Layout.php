<?php

namespace App\Admin\Repositories;

use App\Models\Layout as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Layout extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
