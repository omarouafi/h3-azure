#!/bin/bash

az login

az functionapp create --resource-group OmarResourceGroup --consumption-plan-location japaneast --runtime python --functions-version 3 --name OmarOuafiStoreFunction --storage-account omarouafistorage --os-type Linux
connection_string=$(az storage account show-connection-string --name omarouafistorage --resource-group OmarResourceGroup --query connectionString --output tsv)
az functionapp config appsettings set --name OmarOuafiStoreFunction --resource-group OmarResourceGroup --settings AzureWebJobsStorage=$connection_string

cd OmarOuafiStoreFunction

func azure functionapp publish OmarOuafiStoreFunction

echo "Deployment complete!"