#!/bin/bash

az login

az group create --name OmarResourceGroup --location japaneast

az storage account create --name omarouafistorage --resource-group OmarResourceGroup --location japaneast --sku Standard_LRS
az storage container create --name general-logs --account-name omarouafistorage
az storage container create --name error-logs --account-name omarouafistorage


