#!/bin/bash

## inject linkerd to deployment in default namespace

kubectl get deploy -o yaml | linkerd inject - | kubectl apply -f -

