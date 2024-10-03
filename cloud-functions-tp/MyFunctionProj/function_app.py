import azure.functions as func
import logging

app = func.FunctionApp()

@app.route(route="HelloWorldFunction", auth_level=func.AuthLevel.ANONYMOUS)
def HelloWorldFunction(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    return func.HttpResponse("Hello, World!", status_code=200)
