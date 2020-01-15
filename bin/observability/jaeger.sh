#!/bin/bash
SRC=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "$SRC/../helpers/os.sh"

readonly DASHBOARD=http://localhost:15032

function proxy() {
  kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=jaeger -o jsonpath='{.items[0].metadata.name}') 15032:16686 &
  cmd_open $DASHBOARD
}

"$@"
