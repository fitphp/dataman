<?php

namespace App\Admin\Repositories;

use App\Models\DictData as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class DictData extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
