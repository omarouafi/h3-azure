#!/bin/bash
# Create a Recovery Services Vault
az backup vault create \
  --resource-group MyResourceGroup \
  --name MyRecoveryVault \
  --location japaneast

