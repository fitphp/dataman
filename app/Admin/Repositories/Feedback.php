<?php

namespace App\Admin\Repositories;

use App\Models\Feedback as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Feedback extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
