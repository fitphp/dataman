# 运营管理平台 DataMan

## 简介
基于开源项目数据管理平台（DataMan）是一个轻量的、现代设计风格的移动端数据管理系统。

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

**导入database/install.sql**

```bash
// 进入带有composer的PHP容器
$ docker exec -it PHP容器ID /bin/sh
```

注意，使用容器运行方式并且开启filesystem时，需要在public目录中创建 `storage` 软链指向 `storage/app/public`
```
$ composer install

// 创建软链
$ cd /var/www/html/public
$ ln -s ../storage/app/public storage
```
