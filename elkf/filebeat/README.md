Installation
--------

```
docker build -t dockerstudy/filebeat:5.6 .

```


Usage
--------

Run a container from the image with the following command:
```
docker run --name=filebeat --link=elk_server:elk dockerstudy/filebeat:5.6

```