from fastapi import FastAPI
from vocode.streaming.streaming_conversation import StreamingConversation
from vocode.streaming.agent import ChatGPTAgent
from vocode.streaming.synthesizer import AzureSynthesizer
from vocode.streaming.transcriber import DeepgramTranscriber

app = FastAPI()

@app.get("/")
async def root():
    return {"status": "running"}

@app.get("/health")
async def health():
    return {"status": "healthy"}
