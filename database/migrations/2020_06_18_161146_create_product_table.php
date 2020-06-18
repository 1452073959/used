<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('cid')->comment('分类id');
            $table->string('title')->nullable()->comment('标题');
            $table->text('description')->nullable()->comment('描述');
            $table->string('image')->nullable()->comment('图片');
            $table->decimal('price')->nullable()->comment('价格');
            $table->string('tel')->nullable()->comment('联系方式');
            $table->string('order')->nullable()->comment('//层级');
            $table->tinyInteger('status')->nullable();
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
        Schema::dropIfExists('product');
    }
}
