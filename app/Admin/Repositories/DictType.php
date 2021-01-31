<?php

namespace App\Admin\Repositories;

use App\Models\DictType as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class DictType extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
