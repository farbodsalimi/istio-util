#!/bin/bash

function get_services() {
  kubectl get svc -n istio-system
}

function get_pods() {
  kubectl get pods -n istio-system
}

function enable_injection() {
  kubectl label namespace ${1} istio-injection=enabled
}

function disable_injection() {
  kubectl label namespace ${1} istio-injection-
}

"$@"
