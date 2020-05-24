#!/usr/bin/env bash

set -euxo pipefail

# only have the one for now
kubectl logs --follow $(kubectl get pods | grep jenkins | awk '{print $1}')
