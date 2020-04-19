<?php

use Illuminate\Database\Seeder;

class DriversPayoutsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('drivers_payouts')->delete();
        
        \DB::table('drivers_payouts')->insert(array (
            0 => 
            array (
                'id' => 1,
                'user_id' => 22,
                'method' => 'bank',
                'amount' => 4.0,
                'paid_date' => '2020-03-29 18:33:13',
                'note' => '<p>Not for payout</p>',
                'created_at' => '2020-03-29 18:33:13',
                'updated_at' => '2020-03-29 18:33:13',
            ),
            1 => 
            array (
                'id' => 2,
                'user_id' => 22,
                'method' => 'bank',
                'amount' => 4.0,
                'paid_date' => '2020-03-29 18:33:56',
                'note' => '<p>Not for payout</p>',
                'created_at' => '2020-03-29 18:33:56',
                'updated_at' => '2020-03-29 18:33:56',
            ),
        ));
        
        
    }
}