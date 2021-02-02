<?php

namespace App\Admin\Repositories;

use App\Models\Content as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Content extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
