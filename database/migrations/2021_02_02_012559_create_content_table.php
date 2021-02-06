<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContentTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('content', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title')->default('')->comment('标题');
            $table->string('subtitle')->default('')->nullable()->comment('副标题');
            $table->unsignedInteger('category_id')->default(0)->comment('分类ID');
            $table->string('image')->default('')->comment('图标');
            $table->text('content')->default('')->nullable()->comment('内容');
            $table->string('type')->default('h5')->nullable()->comment('URL类型');
            $table->string('appid')->default('')->nullable()->comment('AppID');
            $table->string('url')->default('')->nullable()->comment('URL');
            $table->unsignedTinyInteger('order')->default(0)->comment('排序');
            $table->unsignedTinyInteger('status')->default(1)->comment('状态');
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
        Schema::dropIfExists('content');
    }
}
