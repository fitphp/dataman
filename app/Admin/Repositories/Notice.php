<?php

namespace App\Admin\Repositories;

use App\Models\Notice as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Notice extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
