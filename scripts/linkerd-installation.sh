#!/bin/bash

## Download Linkerd

curl --proto '=https' --tlsv1.2 -sSfL https://run.linkerd.io/install | sh

export PATH=$PATH:$HOME/.linkerd2/bin

linkerd check --pre


## Install Linkerd onto the cluster

linkerd install --crds | kubectl apply -f -

linkerd install | kubectl apply -f -

linkerd check

echo "export PATH=$PATH:$HOME/.linkerd2/bin" >> ~/.bashrc

source ~/.bashrc