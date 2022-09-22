# UM (User Manual)

## 容器部署 （Docker Deploy）

### Windows Linux子系统 （WSL）

拉取仓库

```bash
git clone https://github.com/xtech-cloud/fmp-docker.git /fmp
``

部署数据存储中心

```bash
cd /fmp/wsl
docker-compose -f docker-compose-dsc.yml up -d
```

部署微服务单元

```bash
cd /fmp/wsl
docker-compose -f docker-compose-msa.yml up -d
```

部署平台管理中心

```bash
cd /fmp/wsl
docker-compose -f docker-compose-dsc.yml up -d
```

### 弹性云服务器（ECS）

适用云服务商：阿里云

#### 虚拟专用网络 （VPC）

创建网段为10.1.0.0/16的VPC

#### 交换机

在VPC下创建如下交换机

| 名称 | 网段          | 主机建议使用IP范围           |
| ---- | ------------- | ------------------------ |
| SRC  | 10.1.1.0/24   | 10.1.1.11-10.1.1.200     |
| DSC  | 10.1.2.0/24   | 10.1.2.11-10.1.2.200     |
| MSA  | 10.1.50.0/24 | 10.1.50.11-10.1.50.200 |
| BLA  | 10.1.100.0/24 | 10.1.100.11-10.1.100.200 |
| VPP  | 10.1.251.0/24 | 10.1.251.11-10.1.251.200 |
| PMC  | 10.1.252.0/24 | 10.1.252.11-10.1.252.200 |
| WEB  | 10.1.253.0/24 | 10.1.253.11-10.1.253.200 |

#### 安全组

创建如下安全组

| 协议            | 端口范围  | 授权对象  | 描述  |
| --------------- | --------- | --------- | ----- |
| 自定义TCP       | 80/80     | 0.0.0.0/0 | HTTP  |
| 自定义TCP       | 443/443   | 0.0.0.0/0 | HTTPS |
| 自定义TCP       | 22/22     | 0.0.0.0/0 | SSH   |
| 全部 ICMP(IPv4) | -1/-1     | 0.0.0.0/0 |       |

#### 文件存储

创建如下文件存储系统

| 资源名 |    类型    |  说明  |  
| ------ | --------- | ------ |
| Data   | 通用性能型 | 数据库使用 |
| File   | 通用容量型 | 文件使用   |

#### 数据存储中心 （Data Storage Center)

创建一台IP地址为10.1.2.11的主机

挂载NAS到目录

| 资源名 |   NAS目录 |  ECS目录 |  
| ------ | --------- | ------ |
| Data   | /dsc-1 | /nas/data |
| File   | /dcs-1 | /nas/file |


拉取仓库

```bash
git clone https://github.com/xtech-cloud/fmp-docker.git /fmp
``

更改docker-compose-dsc.yml中各个容器的密码

部署

```bash
cd /fmp/ecs
docker-compose -f docker-compose-dsc.yml up -d
```

#### 微服务单元 （Micro Service Agent)

创建一台IP地址为10.1.50.11的主机

拉取仓库

```bash
git clone https://github.com/xtech-cloud/fmp-docker.git /fmp
``

部署
```bash
cd /fmp/ecs
docker-compose -f docker-compose-msa.yml up -d
```

#### 平台管理控制台（Platform Management Console)

创建一台IP地址为10.1.50.11的主机

部署平台管理中心

```bash
cd /fmp/ecs
docker-compose -f docker-compose-pmc.yml up -d
```
