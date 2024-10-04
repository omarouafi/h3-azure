#!/bin/bash
az backup protection enable-for-azurefileshare \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --storage-account omarouafistorage \
  --azure-file-share MyFileShare \
  --policy-name DefaultPolicy