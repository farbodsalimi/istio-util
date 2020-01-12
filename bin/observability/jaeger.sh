#!/bin/bash

DASHBOARD=http://localhost:15032

function proxy() {
  kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=jaeger -o jsonpath='{.items[0].metadata.name}') 15032:16686 &
  open $DASHBOARD
}

"$@"
