<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateChannelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('channel', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('parent_id')->default(0)->comment('父ID');
            $table->unsignedInteger('platform_id')->default(0)->comment('平台ID');
            $table->string('name', 50)->default('NULL')->nullable()->comment('名称');
            $table->string('title', 50)->default('')->comment('标题');
            $table->string('image', 255)->default('NULL')->nullable()->comment('图标');
            $table->unsignedTinyInteger('order')->default(0)->comment('排序');
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
        Schema::dropIfExists('channel');
    }
}
