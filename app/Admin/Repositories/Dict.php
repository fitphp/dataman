<?php

namespace App\Admin\Repositories;

use App\Models\Dict as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Dict extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
