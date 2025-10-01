import os, requests

def test_health():
    base = os.environ.get("APP_URL", "http://localhost:8000").rstrip("/")
    r = requests.get(base + "/healthz", timeout=5)
    assert r.status_code == 200
    assert r.json()["status"] == "ok"
