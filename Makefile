install:
	kubectl create -f https://raw.githubusercontent.com/kiegroup/kogito-serverless-operator/main/operator.yaml

configmap:
	kubectl create configmap service-files --from-file=openapi.json
