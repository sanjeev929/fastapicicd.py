from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "FastAPI is Live"}


@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/health_record")
def healthrecord():
    return {"status": "ok"}

