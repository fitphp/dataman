<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChinaRegionTable extends Migration
{
    public function getConnection()
    {
        return config('database.connection') ?: config('database.default');
    }

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::hasTable('china_region'))   {
            Schema::create('china_region', function (Blueprint $table) {
                $table->increments('id');
                $table->bigInteger('area_code', false, true);
                $table->bigInteger('parent_code', false, true);
                $table->unsignedTinyInteger('level', false, true);
                $table->unsignedInteger('zip_code', false, true);
                $table->string('city_code');
                $table->string('name');
                $table->string('short_name');
                $table->string('merger_name');
                $table->string('pinyin');
                $table->unsignedDouble('lng');
                $table->unsignedDouble('lat');
                $table->index(['level','parent_code', 'area_code', 'zip_code','city_code']);
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('china_region');
    }
}
