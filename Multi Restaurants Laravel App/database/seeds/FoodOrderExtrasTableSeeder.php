<?php

use Illuminate\Database\Seeder;

class FoodOrderExtrasTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('food_order_extras')->delete();
        
        \DB::table('food_order_extras')->insert(array (
            0 => 
            array (
                'food_order_id' => 6,
                'extra_id' => 4,
                'price' => 0.0,
            ),
            1 => 
            array (
                'food_order_id' => 7,
                'extra_id' => 7,
                'price' => 0.0,
            ),
        ));
        
        
    }
}