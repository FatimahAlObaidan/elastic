#!/bin/bash
#
kubectl apply -f elastic.namespace.yaml
helm repo add elastic https://helm.elastic.co
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
helm install elasticsearch elastic/elasticsearch --version=7.9.0 --namespace=ommegaa
helm install fluent-bit fluent/fluent-bit --namespace=ommegaa
helm install kibana elastic/kibana --version=7.9.0 --namespace=ommegaa --set service.type=LoadBalancer
kubectl run random-logger --image=chentex/random-logger -n ommegaa
kubectl apply -f ingress.yaml -n ommegaa
kubectl create -n ommegaa clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=jenkins:default
