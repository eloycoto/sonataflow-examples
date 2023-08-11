WORKFLOW_NAME=eloy

Q:=@

install:
	kubectl create -f https://raw.githubusercontent.com/kiegroup/kogito-serverless-operator/main/operator.yaml

configmap:
	kubectl create configmap service-files --from-file=openapi.json

list-workflows:
	$(Q) IP=$$(kubectl get nodes -o json | jq -r '.items[0].status.addresses[]|select(.type=="InternalIP").address'); \
	PORT=$$(kubectl get service $(WORKFLOW_NAME) -o json | jq -r '.spec.ports[0].nodePort'); \
	curl -X 'GET' "http://$$IP:$$PORT/management/processes/$(WORKFLOW_NAME)" -H 'accept: */*' | jq .
