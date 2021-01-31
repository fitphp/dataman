<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDictTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dict_type', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name',64)->default('')->comment('名称');
            $table->string('key',64)->default('')->comment('键名');
            $table->unsignedTinyInteger('status')->default(1)->comment('状态 0停用 1正常');
            $table->string('remark',255)->default('')->nullable()->comment('备注');
            $table->timestamps();
        });

        Schema::create('dict_data', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('type_id')->default(0)->comment('类型ID');
            $table->string('key',64)->default('')->comment('键名');
            $table->string('value',255)->default('')->comment('键值');
            $table->unsignedTinyInteger('order')->default(0)->nullable()->comment('排序');
            $table->unsignedTinyInteger('is_default')->default(0)->comment('是否默认');
            $table->unsignedTinyInteger('status')->default(1)->comment('状态 0停用 1正常');
            $table->string('remark',255)->default('')->nullable()->comment('备注');
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
        Schema::dropIfExists('dict_type');
        Schema::dropIfExists('dict_data');
    }
}
