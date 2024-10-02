from azure.ai.textanalytics import TextAnalyticsClient
from azure.core.credentials import AzureKeyCredential

key = "20c38bd1320e4d75bcb4f095b7e5881f"
endpoint = "https://lab8cognitive.cognitiveservices.azure.com/"

def authenticate_client():
    ta_credential = AzureKeyCredential(key)
    text_analytics_client = TextAnalyticsClient(
            endpoint=endpoint, credential=ta_credential)
    return text_analytics_client

client = authenticate_client()

documents = [
    "I love programming in Azure! It's great for developing cloud applications.",
    "The experience could be better, but overall it is positive."
]

response = client.analyze_sentiment(documents=documents)[0]
print("Sentiment: ", response.sentiment)

key_phrases = client.extract_key_phrases(documents=documents)[0]
print("Key Phrases: ", key_phrases.key_phrases)
