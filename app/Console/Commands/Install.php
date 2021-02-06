<?php
/**
 * Install
 * @Package App\Console\Commands
 * @Version
 * @Copyright 2009-2021 FitPHP Team.
 * @License MIT
 * @Author: boolean since.
 * @DateTime: 2021/2/6 1:10 下午
 * =================================================================
 * 版权所有 (C) 2009-2021 fitphp.com，并保留所有权利。
 * 网站地址:https://www.fitphp.com/
 * =================================================================
 */

namespace App\Console\Commands;

use Illuminate\Console\Command;

class Install extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'dataman:install';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '对DataMan初始化安装';

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
     * @return int
     */
    public function handle(): int
    {
        $this->info('正在优化配置！');
        $this->call('optimize:clear');
        $this->info('正在设置存储系统！');
        $this->call('storage:link');
        $this->info('正在配置APP密钥！');
        $this->call('key:generate');
        $this->info('正在配置JWT密钥！');
        $this->call('jwt:secret');
        $this->info('正在处理数据库迁移！');
        $this->call('migrate');
        $this->info('正在初始化基础数据！');
        /**
         * 数据填充
         */
        //$this->call('db:seed', ['--class' => 'DatabaseSeeder']);
        $this->call('dataman:reset');
        $this->info('安装完成！');
        $this->warn('用户名密码都为：admin');

        return 0;
    }
}
