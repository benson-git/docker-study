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
docker run -d -p 3306:3306 --privileged=true --name mydb -e DB_USER=admin -e DB_PASS=admin -e REMOTE_ADMIN=true -e REMOTE_ADMIN_USER=bwang -e REMOTE_ADMIN_PASS=bwang -v /usr/local/bwang/docker/vfs/dir/mydata:/var/lib/mysql dockerstudy/mysql:5.5
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
docker rm container_id/container_name
```

批量删除停止容器使用
```
docker rm $(sudo docker ps -a -q)
```

```
docker rmi image_id
```

重命名一个容器:
```
docker rename old_name new_name 
```

登录一个容器（在运行的容器中执行命令）:
```
docker exec -it container_id/container_name /bin/bash  
```

退出容器，关闭容器
```
exit 
```

退出容器，不关闭
```
Ctrl+d 
```

终止容器
```
docker stop 44652ba46352
```

终止状态的容器，可以使用docker start来重新启动
```
docker start 44652ba46352
```

启动镜像，写入一些文件或者更新软件（进入容器交互模式，44652ba46352就是容器id）:
```
docker run -it --name rpc-server 3afd47092a0e
[root@44652ba46352 /]# ls
```
--name 参数在容器启动时给容器命名一个自己容易识别的名称

保存一个容器镜像（更新镜像）:
```
docker commit -m="test update" -a="wangsir" 44652ba46352 wangsir/centos-test:7.4.1708
```
参数解释：

-m:提交的描述信息

-a:指定镜像作者

44652ba46352：容器ID

wangsir/centos-test:7.4.1708:指定要创建的目标镜像名

修改镜像标签tag：
```
docker tag 7853e6064af8 wangsir/centos-test:7.4.1708
```

备份镜像
```
docker save -o mysql.tar mysql
```
-mysql.tar 保存的文件
-mysql 镜像名称

导出容器
```
docker export 7e8a0dc1cb88 > mysql.tar
```

恢复镜像
```
cat mysql.tar | docker import - mysql:latest
```

加载镜像
```
docker load -i mysql.tar 
```

搜索指定信息

```
docker ps -a | grep opencv
docker images | grep ubantu
```

Miscellaneous
--------

 >/dev/null 
 - redirects the command standard output to the null device, which is a special device which discards the information written to it

 2 >&1 
 - redirects the standard error stream to the standard output stream (stderr = 2, stdout = 1).
 
 STDIN is represented by 0, STDOUT by 1, and STDERR by 2.

/dev/null is the bit-bucket: the place where you dump anything you don't need.
So, the STDOUT is redirected to the bit-bucket(trash) and the STDERR is redirected to where the STDOUT is located: the bit-bucket.



