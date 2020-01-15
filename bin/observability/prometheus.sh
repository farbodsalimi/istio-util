#!/bin/bash
SRC=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "$SRC/../helpers/os.sh"

readonly DASHBOARD=http://localhost:9090

function proxy() {
  kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090 &
  cmd_open $DASHBOARD
}

"$@"
