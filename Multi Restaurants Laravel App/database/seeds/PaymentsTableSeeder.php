<?php

use Illuminate\Database\Seeder;

class PaymentsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('payments')->delete();
        
        \DB::table('payments')->insert(array (
            0 => 
            array (
                'id' => 3,
                'price' => 12.1,
                'description' => 'Order not paid yet',
                'user_id' => 19,
                'created_at' => '2020-02-29 17:38:45',
                'updated_at' => '2020-02-29 17:38:45',
                'status' => 'Waiting for Client',
                'method' => 'Pay on Pickup',
            ),
            1 => 
            array (
                'id' => 4,
                'price' => 33.21,
                'description' => 'Order not paid yet',
                'user_id' => 19,
                'created_at' => '2020-03-29 17:52:16',
                'updated_at' => '2020-03-29 18:10:20',
                'status' => 'Paid',
                'method' => 'Cash on Delivery',
            ),
            2 => 
            array (
                'id' => 5,
                'price' => 23.1,
                'description' => 'Order not paid yet',
                'user_id' => 19,
                'created_at' => '2020-01-29 17:59:00',
                'updated_at' => '2020-01-29 17:59:00',
                'status' => 'Waiting for Client',
                'method' => 'Pay on Pickup',
            ),
            3 => 
            array (
                'id' => 6,
                'price' => 9.02,
                'description' => 'Order not paid yet',
                'user_id' => 20,
                'created_at' => '2020-03-29 18:00:28',
                'updated_at' => '2020-03-29 18:08:21',
                'status' => 'Paid',
                'method' => 'Cash on Delivery',
            ),
            4 => 
            array (
                'id' => 7,
                'price' => 49.5,
                'description' => 'Order not paid yet',
                'user_id' => 20,
                'created_at' => '2020-03-29 18:01:12',
                'updated_at' => '2020-03-29 18:09:44',
                'status' => 'Paid',
                'method' => 'Cash on Delivery',
            ),
        ));
        
        
    }
}