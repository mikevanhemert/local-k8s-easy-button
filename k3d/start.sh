#!/bin/bash

k3d registry create \
  local \
  -p 32145

k3d cluster create \
  local \
  --servers 1 \
  --agents 3 \
  --registry-use k3d-local:32145 \
  --volume /etc/machine-id:/etc/machine-id \
  --k3s-arg "--disable=traefik@server:0" \
  --port 80:80@loadbalancer \
  --port 443:443@loadbalancer \
  --api-port 6443

