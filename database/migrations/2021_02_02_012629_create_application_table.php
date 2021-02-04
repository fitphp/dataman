<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApplicationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('application', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title')->default('')->comment('标题');
            $table->string('subtitle')->default('')->nullable()->comment('副标题');
            $table->string('image')->default('')->comment('图标');
            $table->string('category_ids')->default('')->comment('分类ID');
            $table->string('type')->default('h5')->comment('URL类型');
            $table->string('appid')->default('')->nullable()->comment('应用编号');
            $table->string('url')->default('')->comment('URL');
            $table->unsignedTinyInteger('order')->default(0)->comment('权重');
            $table->unsignedTinyInteger('auth')->default(0)->comment('认证级别');
            $table->unsignedTinyInteger('status')->default(0)->comment('状态');
            $table->string('remark')->default('')->comment('备注');
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
        Schema::dropIfExists('application');
    }
}
