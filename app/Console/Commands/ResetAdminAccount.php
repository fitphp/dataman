<?php
/**
 * ResetAdminAccount
 * @Package App\Console\Commands
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/6 1:16 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */
namespace App\Console\Commands;

use App\Models\AdminUser;
use Illuminate\Console\Command;

class ResetAdminAccount extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'dataman:reset';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '重置Admin账户';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int|void
     */
    public function handle(): int
    {
        $user = AdminUser::where('username', 'admin')->first();
        if (empty($user)) {
            $user = new AdminUser();
            $user->username = 'admin';
        }
        $user->password = bcrypt('admin');
        $user->name = 'Administrator';
        $user->save();
        $this->info('Admin账户已成功重置为 admin/admin');
        return 0;
    }
}
