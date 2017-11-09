# k8s-study


 调试
--------

使用kubectl describe node来获得Node的详细信息:

```
kubectl describe node mynode 
```

```
kubectl get node mynode -o yaml
```

使用kubectl describe pod来获得Pod的详细信息:

```
kubectl describe pod my-nginx-gy1ij  
```

列出所有事件(事件也是有命名空间的):

```
kubectl get events
```

```
kubectl get events --namespace=my-namespace
```

使用kubectl describe service来获得Service的详细信息:

```
kubectl describe service nginx-service
```

