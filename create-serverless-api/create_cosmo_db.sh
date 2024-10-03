#!/bin/bash

COSMOS_ACCOUNT_NAME="omarcosmodb"
DATABASE_NAME="omarDB"
REGION="japaneast"
CONTAINER_NAME="Users"

az login

az group create --name OmarResourceGroup2 --location $REGION

az cosmosdb create --name $COSMOS_ACCOUNT_NAME --resource-group OmarResourceGroup2 --locations regionName=$REGION failoverPriority=0 --default-consistency-level "Session" --kind "GlobalDocumentDB"

az cosmosdb sql database create --account-name $COSMOS_ACCOUNT_NAME --resource-group OmarResourceGroup2 --name $DATABASE_NAME

az cosmosdb sql container create --account-name $COSMOS_ACCOUNT_NAME --database-name $DATABASE_NAME --name $CONTAINER_NAME --partition-key-path "/id" --throughput 400

