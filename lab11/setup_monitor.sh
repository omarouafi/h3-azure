#!/bin/bash
az monitor log-analytics workspace create \
  --resource-group MyResourceGroup \
  --workspace-name MyLogAnalyticsWorkspace \
  --location japaneast