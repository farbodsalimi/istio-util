#!/bin/bash

DASHBOARD=https://localhost:20001/kiali/console

function proxy() {
  kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=kiali -o jsonpath='{.items[0].metadata.name}') 20001:20001 &
  open $DASHBOARD
}

"$@"
