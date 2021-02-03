<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSystemDictTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('system_dict', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->default('')->comment('名称');
            $table->string('key')->default('')->comment('键名');
            $table->enum('type')->default('keyvalue')->comment('类型');
            $table->longText('value')->default('NULL')->nullable()->comment('键值');
            $table->unsignedTinyInteger('status')->default('1')->comment('状态 0停用 1正常');
            $table->string('remark')->default('')->nullable()->comment('备注');
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
        Schema::dropIfExists('system_dict');
    }
}
