# tests/test_health.py
import os, requests

def test_health():
    base = os.environ.get("APP_URL", "http://localhost:8000")
    url = base.rstrip("/") + "/healthz"
    r = requests.get(url, timeout=5)
    assert r.status_code == 200
    assert r.json().get("status") == "ok"
