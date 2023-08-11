# Sonataflow operator example

Installing sonataflow-operator

```
make install
```

Check that all is ready:

```
$ --> kubectl get pods  -n sonataflow-operator-system
NAME                                                      READY   STATUS    RESTARTS   AGE
sonataflow-operator-controller-manager-56878d76c6-f74h9   2/2     Running   0          8m46s
```

## Installing the first workflow:

`eloy.yaml` is a simple workflow which:

- Define a function called `book` which picks the openapi spec for the target
  api from service-files configmap
- When trigger the workflow, it'll call the book function, which will use thhe
  `get_book_book_get` operationID.
- The function will get the input params from the workflow execution  parameter .userData


To deploy the workflow, the following need to be done:

```
$ --> make configmap
$ --> kubectl apply -f eloy.yaml
```


The status can be get from the kubernetes:
```

$ --> kubectl get pods
NAME                    READY   STATUS        RESTARTS   AGE
eloy-658bcd87f7-fwhn7   1/1     Running       0          2m47s
```

Looking at the description/logs of the pod is interesting to understand what
they do.

The workflow will be deployed in a custom URL, which can be retrieved like:

```
$ --> kubectl get workflows
NAME   PROFILE   VERSION   URL                            READY   REASON
eloy   dev       0.0.1     http://172.18.0.2:32202/eloy   True
```

The workflow can be triggered using `./test.sh`


## What is missing:

- The operator should point to a single dataindex instance.
- The way to do escalations are not yet clear.
- How assesments will be done in the functions.
    - To list workflows in the dataindex `make list-workflows`
    - [ ] Labels per workflow definition? Is that an option?
- How to trigger a workflow with different url from the openapi spec? What happens if the host is not neede?


## Examples:

Serverless workflow examples:
https://github.com/kiegroup/kogito-examples/tree/stable/serverless-workflow-examples

Editor of workflows:
https://start.kubesmarts.org/#/d0602783-7c17-4805-a9b2-77c0772c9afc/file/order.sw.json



## Data Index utilities:

- Graphql interface:
    https://sonataflow.org/serverlessworkflow/latest/data-index/data-index-core-concepts.html#data-index-graphql

- Openapi spec: (curl http://172.18.0.2:32202/q/openapi)
    https://pastebin.com/qC494vf4
