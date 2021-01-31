<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePlatformTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('platform', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name',255)->default('')->comment('名称');
            $table->string('app_id',64)->default('')->nullable()->comment('App ID');
            $table->string('app_secret',64)->default('')->nullable()->comment('App Secret');
            $table->unsignedTinyInteger('switch')->default('1')->comment('开关');
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
        Schema::dropIfExists('platform');
    }
}
