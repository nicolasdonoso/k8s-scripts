#!/bin/bash

export BUCKET_NAME=$1
export KUBE_CONFIG_LOCATION=$2
export NAMESPACE=$3

export KOPS_STATE_STORE="s3://$BUCKET_NAME"
export KUBECONFIG="$KUBE_CONFIG_LOCATION"

# namespace specific commands
alias logs="kubectl -n $NAMESPACE logs -f"
alias po="kubectl -n $NAMESPACE get po"
alias describe="kubectl -n $NAMESPACE describe"
alias ingress="kubectl -n $INGRESS_NAMESPACE get po"
alias crons="kubectl get cronjobs -n $NAMESPACE"
# system commands
alias syslogs="kubectl -n kube-system logs -f"
alias system="kubectl -n kube-system get po"
# nodes check
alias nodes="kubectl get nodes"