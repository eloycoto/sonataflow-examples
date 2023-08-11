# Data index deployment:

# Install

```
$ --> kubectl kustomize hack | kubectl apply -f -
secret/postgres-secrets-4fb9bcmd47 unchanged
service/kafka unchanged
service/postgres unchanged
service/zookeeper unchanged
deployment.apps/data-index unchanged
deployment.apps/kafka unchanged
deployment.apps/postgres unchanged
deployment.apps/zookeeper unchanged
persistentvolumeclaim/postgres-pvc unchanged
$ -->
```
