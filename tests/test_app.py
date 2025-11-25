from app import app


def test_health_endpoint():
    client = app.test_client()
    response = client.get("/health")
    assert response.status_code == 200
    assert response.get_json() == {"status": "ok"}


def test_hello_endpoint():
    client = app.test_client()
    response = client.get("/hello/Vidit")
    assert response.status_code == 200
    data = response.get_json()
    assert "Hello, Vidit" in data["message"]
