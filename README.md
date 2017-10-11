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

Docker 常用命令:
--------

```
docker images
```

```
docker ps -a
```

```
docker stop container-id
```

```
docker start container-id
```

```
docker rmi container-id
```

```
docker rm image-id
```



