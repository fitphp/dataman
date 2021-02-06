<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ChinaRegionTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        \DB::table('china_region')->delete();

        \DB::table('china_region')->insert(array (
            0 =>
            array (
                'id' => 1,
                'parent_id' => 0,
                'order' => 1,
                'title' => 'Index',
                'icon' => 'feather icon-bar-chart-2',
                'uri' => '/',
                'extension' => '',
                'show' => 1,
                'created_at' => '2020-10-10 15:06:20',
                'updated_at' => '2020-12-29 21:39:06',
            ),
        ));
    }
}
