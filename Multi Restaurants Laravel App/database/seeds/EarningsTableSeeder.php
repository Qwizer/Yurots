<?php

use Illuminate\Database\Seeder;

class EarningsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('earnings')->delete();
        \DB::table('earnings')->insert(array (
            0 => 
            array (
                'id' => 1,
                'restaurant_id' => 2,
                'total_orders' => 1,
                'total_earning' => 30.19,
                'admin_earning' => 9.06,
                'restaurant_earning' => 21.13,
                'delivery_fee' => 5.0,
                'tax' => 3.52,
                'created_at' => '2020-03-29 17:20:10',
                'updated_at' => '2020-03-29 18:10:20',
            ),
            1 => 
            array (
                'id' => 2,
                'restaurant_id' => 4,
                'total_orders' => 0,
                'total_earning' => 0.0,
                'admin_earning' => 0.0,
                'restaurant_earning' => 0.0,
                'delivery_fee' => 0.0,
                'tax' => 0.0,
                'created_at' => '2020-03-29 17:20:28',
                'updated_at' => '2020-03-29 17:20:28',
            ),
            2 => 
            array (
                'id' => 3,
                'restaurant_id' => 1,
                'total_orders' => 2,
                'total_earning' => 53.2,
                'admin_earning' => 7.98,
                'restaurant_earning' => 38.99,
                'delivery_fee' => 14.0,
                'tax' => 6.72,
                'created_at' => '2020-03-29 17:20:42',
                'updated_at' => '2020-03-29 18:30:08',
            ),
            3 => 
            array (
                'id' => 4,
                'restaurant_id' => 3,
                'total_orders' => 0,
                'total_earning' => 0.0,
                'admin_earning' => 0.0,
                'restaurant_earning' => 0.0,
                'delivery_fee' => 0.0,
                'tax' => 0.0,
                'created_at' => '2020-03-29 17:20:57',
                'updated_at' => '2020-03-29 17:20:57',
            ),
        ));
        
        
    }
}