<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDeliveryAddressIdOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function ($table) {
            $table->integer('delivery_address_id')->nullable()->unsigned();
            $table->foreign('delivery_address_id')->references('id')->on('delivery_addresses')->onDelete('set null')->onUpdate('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
