Installation
--------

To pull this image from the Docker registry, open a shell prompt and enter:
```
docker run -d -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 --name elk sebp/elk

```
docker pull sebp/elk
```

Usage
--------

Run a container from the image with the following command:
```
docker run -d -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 --name=elk_server sebp/elk

```

kibana URL
--------
http://hostname:5601

Kibana上创建filebeat-* index pattern

