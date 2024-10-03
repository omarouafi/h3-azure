import azure.functions as func
import json
import logging
from azure.storage.blob import BlobServiceClient

app = func.FunctionApp()
connectionString = "YOUR_CONNECTION_STRING"

@app.route(route="log_request", auth_level=func.AuthLevel.ANONYMOUS)
def log_request(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    try:
        log_data = req.get_json()
    except ValueError:
        return func.HttpResponse("No log data provided.", status_code=400)

    blob_service_client = BlobServiceClient.from_connection_string(connectionString)
    
    if log_data.get('level') == 'ERROR':
        container_name = 'error-logs'
    else:
        container_name = 'general-logs'
    
    blob_client = blob_service_client.get_blob_client(container=container_name, blob='logs.txt')
    
    try:
        blob_client.upload_blob(json.dumps(log_data) + "\n", blob_type="AppendBlob", overwrite=True)
        return func.HttpResponse("Logged request!", status_code=200)
    except Exception as e:
        logging.error(f"Error uploading blob: {e}")
        return func.HttpResponse("Error logging request!", status_code=500)