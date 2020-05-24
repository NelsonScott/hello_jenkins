#!/usr/bin/env bash

set -euxo pipefail

# delete all resources
kubectl delete deployment hello-jenkins
kubectl delete service hello-jenkins
kubectl delete ingress hello-jenkins
