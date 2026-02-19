from fastapi import FastAPI
from pydantic import BaseModel
import openai

app = FastAPI()

class Query(BaseModel):
    prompt: str

@app.post("/chat")
def chatbot(query: Query):
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": query.prompt}]
    )
    return {"response": response['choices'][0]['message']['content']}
