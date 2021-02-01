<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSystemNoticeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('system_notice', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title')->default('''')->comment('标题');
            $table->unsignedTinyInteger('from')->default('0')->comment('来源 0 内部 1外部');
            $table->unsignedTinyInteger('status')->default('1')->comment('状态 0 停用 1正常');
            $table->unsignedTinyInteger('top')->default('0')->comment('置顶 0否 1是');
            $table->text('content')->default('''')->nullable()->comment('内容');
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
        Schema::dropIfExists('system_notice');
    }
}
