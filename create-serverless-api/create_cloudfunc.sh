#!/bin/bash

RESOURCE_GROUP="OmarResourceGroup"
FUNCTION_APP_NAME="MyServerlessAPIFunction"
REGION="japaneast"
RUNTIME="python"
FUNCTION_VERSION="4"
PROJECT_DIR="MyServerlessAPIFunction"
OS="Linux"

# az login

# az group create --name $RESOURCE_GROUP --location $REGION

az functionapp create \
  --resource-group $RESOURCE_GROUP \
  --consumption-plan-location $REGION \
  --runtime $RUNTIME \
  --functions-version $FUNCTION_VERSION \
  --name $FUNCTION_APP_NAME \
  --storage-account omarouafistorage \
  --os-type $OS


cd $PROJECT_DIR

func azure functionapp publish $FUNCTION_APP_NAME

echo "Deployment complete!"
