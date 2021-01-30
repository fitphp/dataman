<?php
namespace App\Admin\Repositories;

use App\Models\ChinaRegion as Models;
use Dcat\Admin\Repositories\EloquentRepository;

class ChinaRegion extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Models::class;
}
