from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def welcome() -> dict:
    return {"message": "Hello World"}

@app.get("/hello/{name}")
async def hello(name: str):
    return {"message": f"안녕하세요 {name}님"}