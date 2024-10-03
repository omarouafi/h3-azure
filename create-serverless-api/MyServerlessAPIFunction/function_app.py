import azure.functions as func
import json
import logging
from azure.cosmos import CosmosClient, exceptions


COSMOS_URL = "https://omarcosmodb.documents.azure.com:443/"
COSMOS_KEY = "YOUR_COSMO_KEY"
DATABASE_NAME = 'Users'
CONTAINER_NAME = 'Users'

client = CosmosClient(COSMOS_URL, credential=COSMOS_KEY)
database = client.get_database_client(DATABASE_NAME)
container = database.get_container_client(CONTAINER_NAME)

app = func.FunctionApp()

@app.route(route="users", auth_level=func.AuthLevel.ANONYMOUS)
def users_api(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    if req.method == 'GET':
        users = list(container.read_all_items())
        return func.HttpResponse(json.dumps(users), mimetype='application/json')

    elif req.method == 'POST':
        try:
            user_data = req.get_json()
            user_id = user_data.get('id')
            if user_id:
                container.create_item(body=user_data)
                return func.HttpResponse("User added!", status_code=201)
            else:
                return func.HttpResponse("User ID is required!", status_code=400)
        except ValueError:
            return func.HttpResponse("Invalid input!", status_code=400)

    elif req.method == 'PUT':
        try:
            user_data = req.get_json()
            user_id = user_data.get('id')
            if user_id:
                container.upsert_item(body=user_data)
                return func.HttpResponse("User updated!", status_code=200)
            else:
                return func.HttpResponse("User ID is required!", status_code=400)
        except ValueError:
            return func.HttpResponse("Invalid input!", status_code=400)

    elif req.method == 'DELETE':
        user_id = req.params.get('id')
        if user_id:
            try:
                container.delete_item(item=user_id, partition_key=user_id)
                return func.HttpResponse("User deleted!", status_code=200)
            except exceptions.CosmosHttpResponseError as e:
                if e.status_code == 404:
                    return func.HttpResponse("User not found!", status_code=404)
                else:
                    return func.HttpResponse("Error deleting user!", status_code=500)
        return func.HttpResponse("User ID is required!", status_code=400)

    else:
        return func.HttpResponse("Method not supported!", status_code=405)
