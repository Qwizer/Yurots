<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateRestaurantsPayoutsTable extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('restaurants_payouts', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('restaurant_id')->unsigned();
            $table->string('method', 127);
            $table->double('amount', 9, 2)->default(0);
            $table->dateTime('paid_date');
            $table->text('note');
            $table->timestamps();
            $table->foreign('restaurant_id')->references('id')->on('restaurants')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('restaurants_payouts');
    }
}
