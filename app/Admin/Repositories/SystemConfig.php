<?php

namespace App\Admin\Repositories;

use App\Models\SystemConfig as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class SystemConfig extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
