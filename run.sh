#!/bin/bash

# Install deps
apt update -y
apt install git

# Download source code
git clone https://gitea.com/gitea/act_runner.git
cd act_runner

# Build from source
make build

# Defaults Args
[[ -z "${INSTANCE_URL}" ]] && instance='' || instance="--instance ${INSTANCE_URL}"
[[ -z "${LABELS}" ]] && labels='' || labels="--labels ${LABELS}"
[[ -z "${NAME}" ]] && name='' || name="--name ${NAME}"
[[ -z "${TOKEN}" ]] && token='' || token="--token ${TOKEN}"
[[ -z "${INSECURE}" ]] && insecure='' || insecure="--insecure"

# Register Runner
./act_runner register --no-interactive ${instance} ${labels} ${name} ${token} ${insecure}