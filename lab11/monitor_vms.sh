#!/bin/bash
workspace_id=$(az monitor log-analytics workspace show \
  --resource-group MyResourceGroup \
  --workspace-name MyLogAnalyticsWorkspace \
  --query customerId -o tsv)workspace_id=$(az monitor log-analytics workspace show \
  --resource-group MyResourceGroup \
  --workspace-name MyLogAnalyticsWorkspace \
  --query id -o tsv)

for vm in MyVM1 MyVM2; do
  az monitor diagnostic-settings create \
    --name MyDiagnostics \
    --resource $(az vm show --resource-group MyResourceGroup --name $vm --query id -o tsv) \
    --workspace $workspace_id \
    --metrics '[{"category": "AllMetrics","enabled": true}]' \
    --logs '[{"category": "Administrative","enabled": true},{"category": "Security","enabled": true},{"category": "AuditLogs","enabled": true},{"category": "VMPerformance","enabled": true},{"category": "VMProcess","enabled": true}]'
done