#!/bin/bash
#
kubectl apply -f elastic.namespace.yaml
helm repo add elastic https://helm.elastic.co
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
helm install elasticsearch elastic/elasticsearch --version=7.9.0 --namespace=omega_project
helm install fluent-bit fluent/fluent-bit --namespace=omega_project
helm install kibana elastic/kibana --version=7.9.0 --namespace=omega_project --set service.type=NodePort
kubectl run random-logger --image=chentex/random-logger -n omega_project
kubectl apply -f ingress.yaml -n omega_project
