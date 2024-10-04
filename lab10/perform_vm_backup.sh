#!/bin/bash
az backup protection backup-now \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --container-name "VMAppContainer;Compute;MyResourceGroup;MyVM1" \
  --item-name MyVM1 \
  --retain-until 30-12-2024
