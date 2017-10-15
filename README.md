# docker-study
Docker study


 Install git
--------

```
yum install git-core

```

Clone docker-study project
--------

```
git clone https://github.com/benson-git/docker-study.git

```

Build docker images (基础镜像)
--------

```
docker build -t dockerstudy/centos:7.4 .
```

如果Dockerfile在当前目录下，输入点.就可以进行加载当前目录下的Dockerfile.

查看镜像:

```
docker images
```

显示更底层的容器或image信息:

```
docker inspect study
```

Build docker images for mariaDB
--------

```
docker build -t dockerstudy/mysql:5.5 .
```

运行挂载docker volume的mysql容器
--------

```
docker run -d -p 3306:3306 -v /usr/local/bwang/docker/vfs/dir/mydata:/var/lib/mysql dockerstudy/mysql:5.5
```

 在docker run中加入 --privileged=true给容器加上特定权限，解决chown: changing ownership of '/var/lib/mysql/....': Permission denied问题.

查看容器日志:
```
docker logs container-id
```

只是创建容器，但不运行:

```
docker create [OPTIONS] IMAGE [COMMAND] '[ARG...]'
```

Docker 常用命令:
--------

```
docker images
```

查看已经创建的容器：
```
docker ps -a
```
查看已经启动的容器：
```
docker ps -s
```

```
docker stop container_id/container_name
```

```
docker start container_id/container_name
```

```
docker rmi container_id/container_name
```

```
docker rm image_id
```

重命名一个容器:
```
docker rename old_name new_name 
```

在运行的容器中执行命令:
```
docker exec -it container_id/container_name /bin/bash  
```



