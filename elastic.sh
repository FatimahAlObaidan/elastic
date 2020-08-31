#!/bin/bash
#
kubectl apply -f elastic.namespace.yaml
helm repo add elastic https://helm.elastic.co
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
helm install elasticsearch elastic/elasticsearch --version=7.9.0 --namespace=omegaa
helm install fluent-bit fluent/fluent-bit --namespace=omegaa
helm install kibana elastic/kibana --version=7.9.0 --namespace=omegaa --set service.type=NodePort
kubectl run random-logger --image=chentex/random-logger -n omegaa
kubectl apply -f ingress.yaml -n omegaa
