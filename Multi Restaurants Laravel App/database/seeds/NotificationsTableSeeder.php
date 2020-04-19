<?php

use Illuminate\Database\Seeder;

class NotificationsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('notifications')->delete();
        
        \DB::table('notifications')->insert(array (
            0 => 
            array (
                'id' => '41040b84-a66d-41b8-8a49-b98df15a7cd7',
                'type' => 'App\\Notifications\\StatusChangedOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 19,
                'data' => '{"order_id":3}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 18:10:19',
                'updated_at' => '2020-03-29 18:10:19',
            ),
            1 => 
            array (
                'id' => '87735352-884f-49bc-8a5d-bc2db04f167d',
                'type' => 'App\\Notifications\\StatusChangedOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 20,
                'data' => '{"order_id":5}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 18:02:28',
                'updated_at' => '2020-03-29 18:02:28',
            ),
            2 => 
            array (
                'id' => '9f89145b-3289-4b4c-b913-ac7da1481efc',
                'type' => 'App\\Notifications\\StatusChangedOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 20,
                'data' => '{"order_id":6}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 18:09:43',
                'updated_at' => '2020-03-29 18:09:43',
            ),
            3 => 
            array (
                'id' => 'bacb3e8a-e154-44cf-af2c-f2621797807f',
                'type' => 'App\\Notifications\\NewOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 18,
                'data' => '{"order_id":4}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 17:59:00',
                'updated_at' => '2020-03-29 17:59:00',
            ),
            4 => 
            array (
                'id' => 'cdb4052e-c367-4ac3-971f-282cb2a74902',
                'type' => 'App\\Notifications\\NewOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 18,
                'data' => '{"order_id":5}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 18:00:28',
                'updated_at' => '2020-03-29 18:00:28',
            ),
            5 => 
            array (
                'id' => 'dc1bc324-2164-4bb7-b9d5-02f45368bbbb',
                'type' => 'App\\Notifications\\NewOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 18,
                'data' => '{"order_id":6}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 18:01:12',
                'updated_at' => '2020-03-29 18:01:12',
            ),
            6 => 
            array (
                'id' => 'ec9b37c4-cccf-4650-99e0-84f2afa8dbeb',
                'type' => 'App\\Notifications\\NewOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 18,
                'data' => '{"order_id":3}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 17:52:16',
                'updated_at' => '2020-03-29 17:52:16',
            ),
            7 => 
            array (
                'id' => 'f1537510-ae85-4edd-8f2f-df8e34510b12',
                'type' => 'App\\Notifications\\NewOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 18,
                'data' => '{"order_id":1}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 17:38:45',
                'updated_at' => '2020-03-29 17:38:45',
            ),
            8 => 
            array (
                'id' => 'fc538e25-cc1a-470a-82c2-c152732fa978',
                'type' => 'App\\Notifications\\StatusChangedOrder',
                'notifiable_type' => 'App\\Models\\User',
                'notifiable_id' => 20,
                'data' => '{"order_id":5}',
                'read_at' => NULL,
                'created_at' => '2020-03-29 18:03:32',
                'updated_at' => '2020-03-29 18:03:32',
            ),
        ));
        
        
    }
}