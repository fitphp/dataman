## 简介
laveman是一个专为管理平台而搭建的快速管理平台框架。
得益于 [Laravel](https://laravel.com/) 框架以及 [Dcat Admin](https://dcatadmin.com)
开发平台，使其具备了优雅、简洁的优秀体验。
laveman是完全免费且开源的，任何人都可以无限制的修改代码以及部署服务。

<p align="center">
    <img src="https://img.shields.io/badge/Latest Release-2.0.1-orange" />
    <img src="https://img.shields.io/badge/PHP-7.3+-green" />
    <img src="https://img.shields.io/badge/MariaDB-10.2+-blueviolet" />
    <img src="https://img.shields.io/badge/License-MIT-blue" />
</p>

## 鸣谢

没有它们就没有 laveman：

`JetBrains` 提供优秀的IDE。

<a href="https://www.jetbrains.com/?from=Chemex" target="_blank">
<img src="https://oss.celaraze.com/chemex/jetbrains.svg" />
</a>

[Laravel](https://laravel.com/) ，优雅的 PHP Web 框架。

[Dcat Admin](https://dcatadmin.com) ，高颜值、高效率的后台开发框架。

## 环境要求

`git`，用于管理版本，部署和升级必要工具。

`PHP 7.3 +`

`MariaDB 10.2 +`，数据库引擎，理论上 `MySQL 5.6+` 兼容支持。

`ext-zip` 扩展，注意和 PHP 版本相同。

`ext-json` 扩展，注意和 PHP 版本相同。

`ext-fileinfo` 扩展，注意和 PHP 版本相同。

## 部署

### Docker部署
```bash
$ cd laveman
$ cd src && composer update
$ docker-composer -f docker-compose.yml up -d
```

## 参与贡献

`Fork` 本仓库，修改代码，提交 `Pull Request`。