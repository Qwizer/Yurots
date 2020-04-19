<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('categories')->delete();
        
        \DB::table('categories')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'Grains',
                'created_at' => '2019-08-29 22:54:23',
                'updated_at' => '2019-10-18 12:38:04',
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'Sandwiches',
                'created_at' => '2019-08-29 23:32:04',
                'updated_at' => '2019-08-29 23:32:04',
            ),
            2 => 
            array (
                'id' => 3,
                'name' => 'Vegetables',
                'created_at' => '2019-08-29 23:42:51',
                'updated_at' => '2019-10-18 12:36:57',
            ),
            3 => 
            array (
                'id' => 4,
                'name' => 'Fruits',
                'created_at' => '2019-08-30 12:07:15',
                'updated_at' => '2019-10-18 12:37:18',
            ),
            4 => 
            array (
                'id' => 5,
                'name' => 'Protein',
                'created_at' => '2019-08-30 12:07:38',
                'updated_at' => '2019-10-18 12:37:32',
            ),
        ));
        
        
    }
}