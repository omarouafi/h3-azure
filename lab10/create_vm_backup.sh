#!/bin/bash
az backup protection enable-for-vm \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --vm MyVM1 \
  --policy-name DefaultPolicy

