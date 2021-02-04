<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLayoutTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('layout', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('channel_id')->default('0')->nullable()->comment('栏目ID');
            $table->string('name')->default('')->comment('名称');
            $table->string('title')->default('')->comment('标题');
            $table->string('subtitle')->default('')->nullable()->comment('副标题');
            $table->unsignedTinyInteger('type')->default(0)->comment('类型');
            $table->longText('target_ids')->default('NULL')->nullable()->comment('目标ID');
            $table->unsignedTinyInteger('status')->default(1)->comment('状态');
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
        Schema::dropIfExists('layout');
    }
}
