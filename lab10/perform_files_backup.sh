az backup protection backup-now \
  --resource-group MyResourceGroup \
  --vault-name MyRecoveryVault \
  --container-name AzureFileShareContainer;Storage;MyStorageAccount \
  --item-name MyFileShare \
  --retain-until 30-12-2024