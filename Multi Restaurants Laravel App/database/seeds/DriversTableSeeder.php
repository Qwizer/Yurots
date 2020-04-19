<?php

use Illuminate\Database\Seeder;

class DriversTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('drivers')->delete();
        
        \DB::table('drivers')->insert(array (
            0 => 
            array (
                'id' => 1,
                'user_id' => 22,
                'delivery_fee' => 50.0,
                'total_orders' => 3,
                'earning' => 5.5,
                'available' => 1,
                'created_at' => '2020-03-29 17:22:10',
                'updated_at' => '2020-03-29 18:33:56',
            ),
            1 => 
            array (
                'id' => 2,
                'user_id' => 24,
                'delivery_fee' => 30.0,
                'total_orders' => 0,
                'earning' => 0.0,
                'available' => 1,
                'created_at' => '2020-03-29 17:28:05',
                'updated_at' => '2020-03-29 17:28:24',
            ),
        ));
        
        
    }
}