#!/bin/bash

az network lb create \
  --resource-group MyResourceGroup \
  --name MyLoadBalancer \
  --frontend-ip-name MyFrontEndPool \
  --backend-pool-name MyBackEndPool \
  --public-ip-address MyPublicIP

az network lb probe create \
  --resource-group MyResourceGroup \
  --lb-name MyLoadBalancer \
  --name MyHealthProbe \
  --protocol tcp \
  --port 80

az network lb rule create \
  --resource-group MyResourceGroup \
  --lb-name MyLoadBalancer \
  --name MyLoadBalancingRule \
  --protocol tcp \
  --frontend-port 80 \
  --backend-port 80 \
  --frontend-ip-name MyFrontEndPool \
  --backend-pool-name MyBackEndPool \
  --probe-name MyHealthProbe


for i in 1 2; do
  az network nic ip-config address-pool add \
    --resource-group MyResourceGroup \
    --nic-name MyVM$i'VMNic' \
    --lb-name MyLoadBalancer \
    --address-pool MyBackEndPool \
    --ip-config-name ipconfig1
done