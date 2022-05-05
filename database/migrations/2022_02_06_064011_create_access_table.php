<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAccessTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('access', function (Blueprint $table) {
            $table->id();
            $table->integer('dept_id');
            $table->integer('feat_id');
            $table->enum('read', ['1', '0'])->default('1');
            $table->enum('write', ['1', '0'])->default('1');
            $table->enum('update', ['1', '0'])->default('1');
            $table->enum('remove', ['1', '0'])->default('1');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('access');
    }
}
