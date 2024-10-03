#!/bin/bash

RESOURCE_GROUP="MyResourceGroup"
STORAGE_ACCOUNT="mystorageaccount376"
FUNCTION_APP_NAME="MyFunctionAppOmarOuafi2"
REGION="japaneast"
RUNTIME="python"
FUNCTION_VERSION="4"
PROJECT_DIR="MyFunctionProj"
OS="Linux"

az login

az group create --name $RESOURCE_GROUP --location $REGION

az storage account create --name $STORAGE_ACCOUNT --location $REGION --resource-group $RESOURCE_GROUP --sku Standard_LRS

az functionapp create \
  --resource-group $RESOURCE_GROUP \
  --consumption-plan-location $REGION \
  --runtime $RUNTIME \
  --functions-version $FUNCTION_VERSION \
  --name $FUNCTION_APP_NAME \
  --storage-account $STORAGE_ACCOUNT \
  --os-type $OS


cd $PROJECT_DIR

func azure functionapp publish $FUNCTION_APP_NAME

echo "Deployment complete!"
