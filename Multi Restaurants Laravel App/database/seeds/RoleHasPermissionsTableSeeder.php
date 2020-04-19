<?php

use Illuminate\Database\Seeder;

class RoleHasPermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('role_has_permissions')->delete();
        
        \DB::table('role_has_permissions')->insert(array (
            0 => 
            array (
                'permission_id' => 1,
                'role_id' => 2,
            ),
            1 => 
            array (
                'permission_id' => 1,
                'role_id' => 3,
            ),
            2 => 
            array (
                'permission_id' => 1,
                'role_id' => 4,
            ),
            3 => 
            array (
                'permission_id' => 1,
                'role_id' => 5,
            ),
            4 => 
            array (
                'permission_id' => 2,
                'role_id' => 2,
            ),
            5 => 
            array (
                'permission_id' => 3,
                'role_id' => 2,
            ),
            6 => 
            array (
                'permission_id' => 3,
                'role_id' => 3,
            ),
            7 => 
            array (
                'permission_id' => 4,
                'role_id' => 2,
            ),
            8 => 
            array (
                'permission_id' => 5,
                'role_id' => 2,
            ),
            9 => 
            array (
                'permission_id' => 5,
                'role_id' => 3,
            ),
            10 => 
            array (
                'permission_id' => 6,
                'role_id' => 2,
            ),
            11 => 
            array (
                'permission_id' => 7,
                'role_id' => 2,
            ),
            12 => 
            array (
                'permission_id' => 8,
                'role_id' => 2,
            ),
            13 => 
            array (
                'permission_id' => 9,
                'role_id' => 2,
            ),
            14 => 
            array (
                'permission_id' => 10,
                'role_id' => 2,
            ),
            15 => 
            array (
                'permission_id' => 14,
                'role_id' => 2,
            ),
            16 => 
            array (
                'permission_id' => 15,
                'role_id' => 2,
            ),
            17 => 
            array (
                'permission_id' => 16,
                'role_id' => 2,
            ),
            18 => 
            array (
                'permission_id' => 17,
                'role_id' => 2,
            ),
            19 => 
            array (
                'permission_id' => 18,
                'role_id' => 2,
            ),
            20 => 
            array (
                'permission_id' => 19,
                'role_id' => 2,
            ),
            21 => 
            array (
                'permission_id' => 20,
                'role_id' => 2,
            ),
            22 => 
            array (
                'permission_id' => 21,
                'role_id' => 2,
            ),
            23 => 
            array (
                'permission_id' => 22,
                'role_id' => 2,
            ),
            24 => 
            array (
                'permission_id' => 23,
                'role_id' => 2,
            ),
            25 => 
            array (
                'permission_id' => 24,
                'role_id' => 2,
            ),
            26 => 
            array (
                'permission_id' => 26,
                'role_id' => 2,
            ),
            27 => 
            array (
                'permission_id' => 27,
                'role_id' => 2,
            ),
            28 => 
            array (
                'permission_id' => 28,
                'role_id' => 2,
            ),
            29 => 
            array (
                'permission_id' => 29,
                'role_id' => 2,
            ),
            30 => 
            array (
                'permission_id' => 30,
                'role_id' => 2,
            ),
            31 => 
            array (
                'permission_id' => 30,
                'role_id' => 3,
            ),
            32 => 
            array (
                'permission_id' => 30,
                'role_id' => 4,
            ),
            33 => 
            array (
                'permission_id' => 30,
                'role_id' => 5,
            ),
            34 => 
            array (
                'permission_id' => 31,
                'role_id' => 2,
            ),
            35 => 
            array (
                'permission_id' => 32,
                'role_id' => 2,
            ),
            36 => 
            array (
                'permission_id' => 33,
                'role_id' => 2,
            ),
            37 => 
            array (
                'permission_id' => 33,
                'role_id' => 3,
            ),
            38 => 
            array (
                'permission_id' => 34,
                'role_id' => 2,
            ),
            39 => 
            array (
                'permission_id' => 34,
                'role_id' => 3,
            ),
            40 => 
            array (
                'permission_id' => 35,
                'role_id' => 2,
            ),
            41 => 
            array (
                'permission_id' => 36,
                'role_id' => 2,
            ),
            42 => 
            array (
                'permission_id' => 37,
                'role_id' => 2,
            ),
            43 => 
            array (
                'permission_id' => 38,
                'role_id' => 2,
            ),
            44 => 
            array (
                'permission_id' => 39,
                'role_id' => 2,
            ),
            45 => 
            array (
                'permission_id' => 40,
                'role_id' => 2,
            ),
            46 => 
            array (
                'permission_id' => 41,
                'role_id' => 2,
            ),
            47 => 
            array (
                'permission_id' => 42,
                'role_id' => 2,
            ),
            48 => 
            array (
                'permission_id' => 42,
                'role_id' => 3,
            ),
            49 => 
            array (
                'permission_id' => 43,
                'role_id' => 2,
            ),
            50 => 
            array (
                'permission_id' => 44,
                'role_id' => 2,
            ),
            51 => 
            array (
                'permission_id' => 45,
                'role_id' => 2,
            ),
            52 => 
            array (
                'permission_id' => 46,
                'role_id' => 2,
            ),
            53 => 
            array (
                'permission_id' => 47,
                'role_id' => 2,
            ),
            54 => 
            array (
                'permission_id' => 48,
                'role_id' => 2,
            ),
            55 => 
            array (
                'permission_id' => 48,
                'role_id' => 3,
            ),
            56 => 
            array (
                'permission_id' => 48,
                'role_id' => 5,
            ),
            57 => 
            array (
                'permission_id' => 50,
                'role_id' => 2,
            ),
            58 => 
            array (
                'permission_id' => 51,
                'role_id' => 2,
            ),
            59 => 
            array (
                'permission_id' => 52,
                'role_id' => 2,
            ),
            60 => 
            array (
                'permission_id' => 52,
                'role_id' => 3,
            ),
            61 => 
            array (
                'permission_id' => 53,
                'role_id' => 2,
            ),
            62 => 
            array (
                'permission_id' => 53,
                'role_id' => 3,
            ),
            63 => 
            array (
                'permission_id' => 54,
                'role_id' => 2,
            ),
            64 => 
            array (
                'permission_id' => 54,
                'role_id' => 3,
            ),
            65 => 
            array (
                'permission_id' => 55,
                'role_id' => 2,
            ),
            66 => 
            array (
                'permission_id' => 55,
                'role_id' => 3,
            ),
            67 => 
            array (
                'permission_id' => 56,
                'role_id' => 2,
            ),
            68 => 
            array (
                'permission_id' => 56,
                'role_id' => 3,
            ),
            69 => 
            array (
                'permission_id' => 57,
                'role_id' => 2,
            ),
            70 => 
            array (
                'permission_id' => 57,
                'role_id' => 3,
            ),
            71 => 
            array (
                'permission_id' => 58,
                'role_id' => 2,
            ),
            72 => 
            array (
                'permission_id' => 58,
                'role_id' => 3,
            ),
            73 => 
            array (
                'permission_id' => 59,
                'role_id' => 2,
            ),
            74 => 
            array (
                'permission_id' => 59,
                'role_id' => 3,
            ),
            75 => 
            array (
                'permission_id' => 60,
                'role_id' => 2,
            ),
            76 => 
            array (
                'permission_id' => 60,
                'role_id' => 3,
            ),
            77 => 
            array (
                'permission_id' => 61,
                'role_id' => 2,
            ),
            78 => 
            array (
                'permission_id' => 61,
                'role_id' => 3,
            ),
            79 => 
            array (
                'permission_id' => 62,
                'role_id' => 2,
            ),
            80 => 
            array (
                'permission_id' => 62,
                'role_id' => 3,
            ),
            81 => 
            array (
                'permission_id' => 63,
                'role_id' => 2,
            ),
            82 => 
            array (
                'permission_id' => 63,
                'role_id' => 3,
            ),
            83 => 
            array (
                'permission_id' => 64,
                'role_id' => 2,
            ),
            84 => 
            array (
                'permission_id' => 64,
                'role_id' => 3,
            ),
            85 => 
            array (
                'permission_id' => 67,
                'role_id' => 2,
            ),
            86 => 
            array (
                'permission_id' => 68,
                'role_id' => 2,
            ),
            87 => 
            array (
                'permission_id' => 69,
                'role_id' => 2,
            ),
            88 => 
            array (
                'permission_id' => 70,
                'role_id' => 2,
            ),
            89 => 
            array (
                'permission_id' => 70,
                'role_id' => 3,
            ),
            90 => 
            array (
                'permission_id' => 71,
                'role_id' => 2,
            ),
            91 => 
            array (
                'permission_id' => 71,
                'role_id' => 3,
            ),
            92 => 
            array (
                'permission_id' => 72,
                'role_id' => 2,
            ),
            93 => 
            array (
                'permission_id' => 72,
                'role_id' => 3,
            ),
            94 => 
            array (
                'permission_id' => 73,
                'role_id' => 2,
            ),
            95 => 
            array (
                'permission_id' => 73,
                'role_id' => 3,
            ),
            96 => 
            array (
                'permission_id' => 74,
                'role_id' => 2,
            ),
            97 => 
            array (
                'permission_id' => 74,
                'role_id' => 3,
            ),
            98 => 
            array (
                'permission_id' => 75,
                'role_id' => 2,
            ),
            99 => 
            array (
                'permission_id' => 75,
                'role_id' => 3,
            ),
            100 => 
            array (
                'permission_id' => 76,
                'role_id' => 2,
            ),
            101 => 
            array (
                'permission_id' => 76,
                'role_id' => 3,
            ),
            102 => 
            array (
                'permission_id' => 77,
                'role_id' => 2,
            ),
            103 => 
            array (
                'permission_id' => 77,
                'role_id' => 3,
            ),
            104 => 
            array (
                'permission_id' => 78,
                'role_id' => 2,
            ),
            105 => 
            array (
                'permission_id' => 78,
                'role_id' => 3,
            ),
            106 => 
            array (
                'permission_id' => 79,
                'role_id' => 2,
            ),
            107 => 
            array (
                'permission_id' => 80,
                'role_id' => 2,
            ),
            108 => 
            array (
                'permission_id' => 80,
                'role_id' => 3,
            ),
            109 => 
            array (
                'permission_id' => 81,
                'role_id' => 2,
            ),
            110 => 
            array (
                'permission_id' => 81,
                'role_id' => 3,
            ),
            111 => 
            array (
                'permission_id' => 82,
                'role_id' => 2,
            ),
            112 => 
            array (
                'permission_id' => 82,
                'role_id' => 3,
            ),
            113 => 
            array (
                'permission_id' => 83,
                'role_id' => 2,
            ),
            114 => 
            array (
                'permission_id' => 83,
                'role_id' => 3,
            ),
            115 => 
            array (
                'permission_id' => 83,
                'role_id' => 4,
            ),
            116 => 
            array (
                'permission_id' => 83,
                'role_id' => 5,
            ),
            117 => 
            array (
                'permission_id' => 85,
                'role_id' => 2,
            ),
            118 => 
            array (
                'permission_id' => 86,
                'role_id' => 2,
            ),
            119 => 
            array (
                'permission_id' => 86,
                'role_id' => 3,
            ),
            120 => 
            array (
                'permission_id' => 86,
                'role_id' => 4,
            ),
            121 => 
            array (
                'permission_id' => 86,
                'role_id' => 5,
            ),
            122 => 
            array (
                'permission_id' => 87,
                'role_id' => 2,
            ),
            123 => 
            array (
                'permission_id' => 88,
                'role_id' => 2,
            ),
            124 => 
            array (
                'permission_id' => 89,
                'role_id' => 2,
            ),
            125 => 
            array (
                'permission_id' => 90,
                'role_id' => 2,
            ),
            126 => 
            array (
                'permission_id' => 91,
                'role_id' => 2,
            ),
            127 => 
            array (
                'permission_id' => 92,
                'role_id' => 2,
            ),
            128 => 
            array (
                'permission_id' => 92,
                'role_id' => 3,
            ),
            129 => 
            array (
                'permission_id' => 92,
                'role_id' => 4,
            ),
            130 => 
            array (
                'permission_id' => 92,
                'role_id' => 5,
            ),
            131 => 
            array (
                'permission_id' => 95,
                'role_id' => 2,
            ),
            132 => 
            array (
                'permission_id' => 96,
                'role_id' => 2,
            ),
            133 => 
            array (
                'permission_id' => 97,
                'role_id' => 2,
            ),
            134 => 
            array (
                'permission_id' => 98,
                'role_id' => 2,
            ),
            135 => 
            array (
                'permission_id' => 98,
                'role_id' => 3,
            ),
            136 => 
            array (
                'permission_id' => 98,
                'role_id' => 4,
            ),
            137 => 
            array (
                'permission_id' => 98,
                'role_id' => 5,
            ),
            138 => 
            array (
                'permission_id' => 103,
                'role_id' => 2,
            ),
            139 => 
            array (
                'permission_id' => 103,
                'role_id' => 3,
            ),
            140 => 
            array (
                'permission_id' => 103,
                'role_id' => 4,
            ),
            141 => 
            array (
                'permission_id' => 103,
                'role_id' => 5,
            ),
            142 => 
            array (
                'permission_id' => 104,
                'role_id' => 2,
            ),
            143 => 
            array (
                'permission_id' => 104,
                'role_id' => 3,
            ),
            144 => 
            array (
                'permission_id' => 104,
                'role_id' => 4,
            ),
            145 => 
            array (
                'permission_id' => 104,
                'role_id' => 5,
            ),
            146 => 
            array (
                'permission_id' => 107,
                'role_id' => 2,
            ),
            147 => 
            array (
                'permission_id' => 107,
                'role_id' => 3,
            ),
            148 => 
            array (
                'permission_id' => 107,
                'role_id' => 4,
            ),
            149 => 
            array (
                'permission_id' => 107,
                'role_id' => 5,
            ),
            150 => 
            array (
                'permission_id' => 108,
                'role_id' => 2,
            ),
            151 => 
            array (
                'permission_id' => 108,
                'role_id' => 3,
            ),
            152 => 
            array (
                'permission_id' => 109,
                'role_id' => 2,
            ),
            153 => 
            array (
                'permission_id' => 109,
                'role_id' => 3,
            ),
            154 => 
            array (
                'permission_id' => 110,
                'role_id' => 2,
            ),
            155 => 
            array (
                'permission_id' => 110,
                'role_id' => 3,
            ),
            156 => 
            array (
                'permission_id' => 111,
                'role_id' => 2,
            ),
            157 => 
            array (
                'permission_id' => 111,
                'role_id' => 3,
            ),
            158 => 
            array (
                'permission_id' => 111,
                'role_id' => 4,
            ),
            159 => 
            array (
                'permission_id' => 111,
                'role_id' => 5,
            ),
            160 => 
            array (
                'permission_id' => 112,
                'role_id' => 2,
            ),
            161 => 
            array (
                'permission_id' => 113,
                'role_id' => 2,
            ),
            162 => 
            array (
                'permission_id' => 113,
                'role_id' => 3,
            ),
            163 => 
            array (
                'permission_id' => 113,
                'role_id' => 4,
            ),
            164 => 
            array (
                'permission_id' => 113,
                'role_id' => 5,
            ),
            165 => 
            array (
                'permission_id' => 114,
                'role_id' => 2,
            ),
            166 => 
            array (
                'permission_id' => 114,
                'role_id' => 3,
            ),
            167 => 
            array (
                'permission_id' => 114,
                'role_id' => 4,
            ),
            168 => 
            array (
                'permission_id' => 114,
                'role_id' => 5,
            ),
            169 => 
            array (
                'permission_id' => 117,
                'role_id' => 2,
            ),
            170 => 
            array (
                'permission_id' => 117,
                'role_id' => 3,
            ),
            171 => 
            array (
                'permission_id' => 117,
                'role_id' => 4,
            ),
            172 => 
            array (
                'permission_id' => 117,
                'role_id' => 5,
            ),
            173 => 
            array (
                'permission_id' => 118,
                'role_id' => 2,
            ),
            174 => 
            array (
                'permission_id' => 119,
                'role_id' => 2,
            ),
            175 => 
            array (
                'permission_id' => 120,
                'role_id' => 2,
            ),
            176 => 
            array (
                'permission_id' => 121,
                'role_id' => 2,
            ),
            177 => 
            array (
                'permission_id' => 122,
                'role_id' => 2,
            ),
            178 => 
            array (
                'permission_id' => 123,
                'role_id' => 2,
            ),
            179 => 
            array (
                'permission_id' => 124,
                'role_id' => 2,
            ),
            180 => 
            array (
                'permission_id' => 129,
                'role_id' => 2,
            ),
            181 => 
            array (
                'permission_id' => 130,
                'role_id' => 2,
            ),
            182 => 
            array (
                'permission_id' => 130,
                'role_id' => 3,
            ),
            183 => 
            array (
                'permission_id' => 130,
                'role_id' => 5,
            ),
            184 => 
            array (
                'permission_id' => 131,
                'role_id' => 2,
            ),
            185 => 
            array (
                'permission_id' => 134,
                'role_id' => 2,
            ),
            186 => 
            array (
                'permission_id' => 134,
                'role_id' => 3,
            ),
            187 => 
            array (
                'permission_id' => 135,
                'role_id' => 2,
            ),
            188 => 
            array (
                'permission_id' => 135,
                'role_id' => 3,
            ),
            189 => 
            array (
                'permission_id' => 137,
                'role_id' => 2,
            ),
            190 => 
            array (
                'permission_id' => 137,
                'role_id' => 3,
            ),
            191 => 
            array (
                'permission_id' => 138,
                'role_id' => 2,
            ),
            192 => 
            array (
                'permission_id' => 144,
                'role_id' => 2,
            ),
            193 => 
            array (
                'permission_id' => 144,
                'role_id' => 5,
            ),
            194 => 
            array (
                'permission_id' => 145,
                'role_id' => 2,
            ),
            195 => 
            array (
                'permission_id' => 145,
                'role_id' => 3,
            ),
            196 => 
            array (
                'permission_id' => 145,
                'role_id' => 5,
            ),
            197 => 
            array (
                'permission_id' => 146,
                'role_id' => 2,
            ),
            198 => 
            array (
                'permission_id' => 146,
                'role_id' => 3,
            ),
            199 => 
            array (
                'permission_id' => 146,
                'role_id' => 5,
            ),
            200 => 
            array (
                'permission_id' => 148,
                'role_id' => 2,
            ),
            201 => 
            array (
                'permission_id' => 149,
                'role_id' => 2,
            ),
            202 => 
            array (
                'permission_id' => 151,
                'role_id' => 2,
            ),
            203 => 
            array (
                'permission_id' => 152,
                'role_id' => 2,
            ),
            204 => 
            array (
                'permission_id' => 152,
                'role_id' => 3,
            ),
            205 => 
            array (
                'permission_id' => 153,
                'role_id' => 2,
            ),
            206 => 
            array (
                'permission_id' => 153,
                'role_id' => 3,
            ),
            207 => 
            array (
                'permission_id' => 155,
                'role_id' => 2,
            ),
            208 => 
            array (
                'permission_id' => 156,
                'role_id' => 2,
            ),
            209 => 
            array (
                'permission_id' => 158,
                'role_id' => 2,
            ),
            210 => 
            array (
                'permission_id' => 159,
                'role_id' => 2,
            ),
            211 => 
            array (
                'permission_id' => 160,
                'role_id' => 2,
            ),
        ));
        
        
    }
}