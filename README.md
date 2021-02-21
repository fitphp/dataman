# 数据管理平台 DataMan
<p align="center">
    <img src="https://img.shields.io/badge/Version-1.0.0-orange" />
    <img src="https://img.shields.io/badge/PHP-7.4+-green" />
    <img src="https://img.shields.io/badge/MariaDB-10.2+-blueviolet" />
    <img src="https://img.shields.io/badge/License-MIT-blue" />
</p>

## 简介
数据管理平台（DataMan）是一个轻量的、现代设计风格的移动端数据管理系统。
得益于 [Dcat-Admin](https://gitee.com/jqhph/dcat-admin) 开发平台，
使其具备了优雅、简洁的优秀体验。

数据管理平台（DataMan）是完全免费且开源的，任何人都可以无限制的修改代码以及部署服务，
这对于很多想要对数据管理的应用平台来说是一个很好的选择：低廉的成本换回的是高效的管理方案，同时又有健康的生态提供支持。

[![Stargazers over time](https://whnb.wang/img/fitphp/dataman)](https://whnb.wang/fitphp/dataman)

### 特点
经典的 LNMP 环境即可运行。

使用先进的 Web 框架进行开发。

简洁优雅的使用体验。

  - [x] 配置管理（字典管理）
  - [x] 附件管理
  - [x] 中国区域
  - [x] 应用管理
  - [x] 内容管理
  - [x] 平台管理
  - [x] 栏目管理：频道与页面
  - [x] 分类管理：无限级分类
  - [x] 通知公告
  - [x] 广告管理：
    - [x] 位置管理 
    - [x] 广告管理
  - [x] 布局管理
    
### 特性
* 内置用户和权限系统
* model-grid支持快速构建数据表格
* model-form支持快速构建数据表单
* model-tree支持快速构建树状数据
* 内置40+种form元素组件、以及支持扩展组件
* 支持Laravel的多种模型关系
* mysql、mongodb、pgsql等多数据库支持
* 支持引入第三方前端库
* 数据库和artisan命令行工具的web实现
* 支持自定义图表
* 多种常用web组件
* 支持本地和oss文件上传

## 环境要求
`git`，用于管理版本，部署和升级必要工具。

`MariaDB 10.2 +`，数据库引擎，理论上 `MySQL 5.6+` 兼容支持。

`PHP 7.3 +` ，已经支持 PHP 8 。
- `ext-zip` 扩展，注意和 PHP 版本相同。
- `ext-json` 扩展，注意和 PHP 版本相同。
- `ext-fileinfo` 扩展，注意和 PHP 版本相同。
- `ext-ldap` 扩展，注意和 PHP 版本相同。
- `ext-bcmath` 扩展，注意和 PHP 版本相同。

更多 PHP版本 镜像 [bincent/php](https://hub.docker.com/r/bincent/php)；
所需扩展均已安装，Composer 镜像为阿里云镜像

## 安装部署

### Docker 环境（推荐）
#### Nginx + PHP 8.0
```
$ cd ./docker
$ docker-compose -f docker-compose.yml up -d
```

**使用Docker脚本，按照【安装步骤】3、4、5、6、9 即可**

```bash
// 进入带有composer的PHP容器
$ docker exec -it PHP容器ID /bin/sh
```

注意，使用容器运行方式并且开启filesystem时，需要在public目录中创建 `storage` 软链指向 `storage/app/public`
```
// 创建软链
$ cd /var/www/html/public
$ ln -s ../storage/app/public storage
```

*更多版本部署环境 可参考：[Nginx + PHP Docker](https://gitee.com/fitphp/docker-nginx-php) *

### 自有环境
自建可以自行百度，宝塔等一键部署环境

## 安装步骤

生产环境下为遵守安全策略，非常建议在服务器本地进行部署，暂时不提供相关线上初始化安装的功能。因此，虽然前期部署的步骤较多，但已经为大家自动化处理了很大部分的流程，只需要跟着下面的命令一步步执行，一般是不会有部署问题的。

1：创建一个数据库，命名任意，但记得之后填写配置时需要对应正确，并且数据库字符集为 `utf8mb4_unicode_ci`。

2：在你想要的目录中，执行 `git clone https://gitee.com/fitphp/dataman.git` 完成下载。

3：在项目根目录中，复制 `.env.example` 文件为一份新的，并重命名为 `.env`。

4：在 `.env` 中配置数据库信息。

5：进入项目根目录，执行 `composer install` 进行安装。

6：进入项目根目录，执行 `php artisan dataman:install` 进行安装。

7：你可能使用的web服务器为 `nginx` 以及 `apache`，无论怎样，应用的起始路径在 `/public` 目录，请确保指向正确，同时程序的根目录权限应该调整为：拥有者和你的 Web
服务器运行用户一致，且根目录权限为 `755`。

8：web服务器配置参考
```ssh
server {
    listen 80;
    index index.php index.html;
    server_name dataman.domain.com;
    root /var/www/html/dataman/public;
    
    add_header X-XSS-Protection '1; mode=block';
    add_header X-Content-Type-Options 'nosniff';

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location /(favicon.ico|robots.txt) { 
        access_log off; 
        log_not_found off; 
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php80-fpm:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~ /\.(ht|svn|git) { deny all; }
}
```

9：此时可以通过访问 `http://your_domain` 来使用。管理员账号密码为：`admin / admin`。

## 更新（通过Git Pull方式）

随时随地保持更新可以在项目根目录中执行 `sudo git reset --hard && git pull --force` 命令，将会同步分支的最新修改内容。

接着，执行 `php artisan dataman:update` 来进行升级。

## 控制台命令
### 创建管理员
```bash
php artisan admin:create-user
```
这个命令用来创建一个admin用户，用交互式的方式填写用户名和密码、并且选择角色之后，会创建一个可登录的用户

### 重置管理员密码
```bash
php artisan admin:reset-password
```
这个命令用来给指定用户重置密码，根据命令的提示来操作

## 版权信息

数据管理平台（DataMan）基于遵循 [MIT](https://opensource.org/licenses/MIT) 开源协议的 Dcat-Admin 框架二次开发。

## 鸣谢
[Laravel](https://laravel.com/) ，优雅的 PHP Web 框架。

[Dcat Admin](https://dcatadmin.com) ，高颜值、高效率的后台开发框架。

### 参与开源
欢迎提交 [issue](https://gitee.com/fitphp/dataman/issues)
