# k8s-study


 ����
--------

ʹ��kubectl describe node�����Node����ϸ��Ϣ:

```
kubectl describe node mynode 
```

```
kubectl get node mynode -o yaml
```

ʹ��kubectl describe pod�����Pod����ϸ��Ϣ:

```
kubectl describe pod my-nginx-gy1ij  
```

�г������¼�(�¼�Ҳ���������ռ��):

```
kubectl get events
```

```
kubectl get events --namespace=my-namespace
```

ʹ��kubectl describe service�����Service����ϸ��Ϣ:

```
kubectl describe service nginx-service
```

