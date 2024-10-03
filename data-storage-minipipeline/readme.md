# Intégration de Stockage de Données - Pipeline

Ce document résume les étapes que j'ai suivies pour créer un pipeline d'intégration de stockage de données sur Azure afin d'enregistrer les interactions des utilisateurs.

## Étapes

### 1. Création d'un compte de stockage

J'ai créé un compte de stockage en utilisant la commande suivante :

```bash
az storage account create --name omarouafistorage --resource-group OmarResourceGroup --location japaneast --sku Standard_LRS
```

### 2. Création des conteneurs de stockage

J'ai créé deux conteneurs de stockage : un pour les general-logs et un autre pour les error-logs avec les commandes suivantes :

```bash
az storage container create --name general-logs --account-name omarouafistorage
az storage container create --name error-logs --account-name omarouafistorage
```

### 3. Création de l'application Function dans Azure

```bash
az functionapp create --name MyFunctionApp --resource-group OmarResourceGroup --plan MyPlan --runtime python --runtime-version 3.10 --functions-version 4 --storage-account omarouafistorage
```

### 4. Création de la fonction localement

```bash
func init LogStorageProj --python
cd LogStorageProj
func new --name LogRequestFunction --template "HTTP trigger" --authlevel "anonymous"
```

### 5. Ajout du code pour simuler les logs

J'ai fourni le code qui simule des logs et les pousse vers le stockage en utilisant la chaîne de connexion.

### 6. Publication de la fonction sur Azure

```bash
func azure functionapp publish MyFunctionApp
```
