from fastapi import FastAPI

app = FastAPI()

@app.get('/api/')
def api():
    welcome: str = 1
    return welcome

