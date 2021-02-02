<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAdvertDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('advert_data', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title')->default('')->comment('标题');
            $table->string('image')->default('NULL')->nullable()->comment('图标');
            $table->unsignedInteger('pin_id')->default('0')->comment('位置ID');
            $table->string('desc')->default('')->nullable()->comment('描述');
            $table->string('type')->default('NULL')->nullable()->comment('类型');
            $table->string('appid')->default('NULL')->nullable()->comment('AppID');
            $table->string('url')->default('NULL')->nullable()->comment('链接');
            $table->unsignedTinyInteger('status')->default('1')->comment('状态 0 禁用 1正常');
            $table->unsignedTinyInteger('order')->default('0')->comment('排序');
            $table->timestamp('start_at')->default('NULL')->nullable()->comment('开始时间');
            $table->timestamp('end_at')->default('NULL')->nullable()->comment('结束时间');
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
        Schema::dropIfExists('advert_data');
    }
}
