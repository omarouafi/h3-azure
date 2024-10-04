#!/bin/bash

az network vnet create \
  --resource-group MyResourceGroup \
  --name MyVNet \
  --subnet-name MySubnet

for i in 1 2; do
  az vm create \
    --resource-group MyResourceGroup \
    --name MyVM$i \
    --vnet-name MyVNet \
    --subnet MySubnet \
    --image Ubuntu2204 \
    --admin-username azureuser \
    --generate-ssh-keys
done

az network public-ip create \
  --resource-group MyResourceGroup \
  --name MyPublicIP \
  --sku Standard \
  --allocation-method Static

