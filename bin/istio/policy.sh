#!/bin/bash

function policy_enforcement() {
  kubectl -n istio-system get cm istio -o jsonpath="{@.data.mesh}" | grep disablePolicyChecks
}

"$@"
