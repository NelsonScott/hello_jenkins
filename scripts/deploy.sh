#!/usr/bin/env bash

set -euxo pipefail

# deploy to k8s
kubectl apply -f hello-jenkins-deployment.yaml
kubectl apply -f hello-jenkins-service.yaml
kubectl apply -f hello-jenkins-ingress.yaml
