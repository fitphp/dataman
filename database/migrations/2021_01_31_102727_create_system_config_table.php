<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSystemConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('system_config', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 64)->default('')->nullable()->comment('名称');
            $table->string('key',64)->default('')->nullable()->comment('键名');
            $table->string('value',255)->default('')->nullable()->comment('键值');
            $table->unsignedTinyInteger('type')->default(0)->comment('内置 （0否 1是）');
            $table->string('remark',255)->default('')->comment('备注');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('system_config');
    }
}