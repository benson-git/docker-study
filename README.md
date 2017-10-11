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
