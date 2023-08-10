#!/bin/bash
curl -X POST -H 'Content-Type:application/json' -H 'Accept:application/json' $(kubectl get workflow eloy -o json | jq -r .status.endpoint) \
    -d '{"userData": "test"}'
