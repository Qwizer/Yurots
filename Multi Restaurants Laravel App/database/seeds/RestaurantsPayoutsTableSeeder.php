<?php

use Illuminate\Database\Seeder;

class RestaurantsPayoutsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('restaurants_payouts')->delete();
        
        \DB::table('restaurants_payouts')->insert(array (
            0 => 
            array (
                'id' => 1,
                'restaurant_id' => 1,
                'method' => 'Bank',
                'amount' => 5.0,
                'paid_date' => '2020-03-29 18:30:08',
                'note' => '<p>Note</p>',
                'created_at' => '2020-03-29 18:30:08',
                'updated_at' => '2020-03-29 18:30:08',
            ),
        ));
        
        
    }
}