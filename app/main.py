from fastapi import FastAPI
import requests
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

@app.get("/test_requests")
def test_requests():
    try:
        response = requests.get("https://httpbin.org/get", timeout=5)
        data = response.json()
        return {"status": "success", "url": data["url"]}
    except Exception as e:
        return {"status": "error", "message": str(e)}

