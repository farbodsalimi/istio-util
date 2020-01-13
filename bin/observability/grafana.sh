#!/bin/bash
SRC=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "$SRC/../helpers/os.sh"

DASHBOARD=http://localhost:3000/dashboard/db/istio-mesh-dashboard

function proxy() {
  kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
  cmd_open $DASHBOARD
}

"$@"
