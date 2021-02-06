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
            $table->string('name', 255)->default('')->comment('名称');
            $table->string('key', 64)->default('')->comment('键名');
            $table->string('group', 30)->default('')->comment('分组');
            $table->text('value')->default('NULL')->nullable()->comment('键值');
            $table->unsignedTinyInteger('status')->default(1)->comment('状态 0停用 1正常');
            $table->string('remark', 255)->default('')->nullable()->comment('备注');
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
