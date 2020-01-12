#!/bin/bash

function get_ingress_info() {
  INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
  INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
  SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')

  echo "INGRESS HOST: ${INGRESS_HOST}"
  echo "INGRESS PORT: ${INGRESS_PORT}"
  echo "SECURE INGRESS PORT: ${SECURE_INGRESS_PORT}"
}

"$@"
