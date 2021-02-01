<?php

namespace App\Admin\Repositories;

use App\Models\AdvertData as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class AdvertData extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
