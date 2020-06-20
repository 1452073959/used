<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStickTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stick', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamp('endtime')->nullable()->comment('开始时间');
            $table->timestamp('starttime')->nullable()->comment('结束时间');
            $table->decimal('price')->nullable()->comment('价格');
            $table->integer('pid')->nullable()->comment('商品id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stick');
    }
}
