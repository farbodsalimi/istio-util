#!/bin/bash
SRC=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source "$SRC/../helpers/os.sh"

DASHBOARD=https://localhost:20001/kiali/console

function proxy() {
  kubectl -n logging port-forward $(kubectl -n logging get pod -l app=kibana -o jsonpath='{.items[0].metadata.name}') 5601:5601 &
  cmd_open $DASHBOARD
}

"$@"
