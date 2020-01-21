#!/bin/bash

# List Namespaces managed by Anthos Config Management
function namespaces() {
	kubectl get ns -l app.kubernetes.io/managed-by=configmanagement.gke.io
}

# List ClusterRoles managed by Anthos Config Management
function cluster_roles(){
	kubectl get clusterroles -l app.kubernetes.io/managed-by=configmanagement.gke.io
}

# List Roles managed by Anthos Config Management
function roles() {
	kubectl get rolebinding -o json | jq -cr \
	  '.items[] | select(.metadata.annotations."configmanagement.gke.io/managed" == "enabled" ) | [.metadata.name,.metadata.namespace] | @tsv'
}

"$@"
