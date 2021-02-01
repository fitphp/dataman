<?php

namespace App\Admin\Repositories;

use App\Models\AdvertPin as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class AdvertPin extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
