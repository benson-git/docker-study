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

Build docker images (��������)
--------

```
docker build -t dockerstudy/centos:7.4 .
```

���Dockerfile�ڵ�ǰĿ¼�£������.�Ϳ��Խ��м��ص�ǰĿ¼�µ�Dockerfile.

�鿴����:

```
docker images
```

��ʾ���ײ��������image��Ϣ:

```
docker inspect study
```

Build docker images for mariaDB
--------

```
docker build -t dockerstudy/mysql:5.5 .
```

���й���docker volume��mysql����
--------

```
docker run -d -p 3306:3306 -v /usr/local/bwang/docker/vfs/dir/mydata:/var/lib/mysql dockerstudy/mysql:5.5
```

 ��docker run�м��� --privileged=true�����������ض�Ȩ�ޣ����chown: changing ownership of '/var/lib/mysql/....': Permission denied����.

�鿴������־:
```
docker logs container-id
```

Docker ��������:
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



