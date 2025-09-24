# Spring Boot API with Keycloak Authentication

This repository demonstrates how to secure a **Spring Boot REST API** using **Keycloak** as the Authorization Server and OAuth2 Resource Server support from Spring Security.

Everything is containerized with **Docker Compose**:
- **Keycloak** as the Authorization Server
- **Spring Boot Notes API** as the Resource Server

---

## Features
-  **JWT-based authentication** with Keycloak
-  **Fully containerized** (Keycloak + API in Docker Compose)
-  Endpoints protected with **OAuth2 Resource Server**

---

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/coolioalexander/secured-api.git
```

### 2. Start the containers
```bash
cd local
docker compose up -d
```
This will start:

- Keycloak → http://localhost:8080 (admin UI : http://localhost:8080/admin)
- Spring Boot Notes API → http://localhost:9090

### 3. Get an Access Token

Use the client credentials flow to get a token from Keycloak:
```bash
curl -X POST "http://localhost:8080/realms/idp-realm/protocol/openid-connect/token" \
-H "Content-Type: application/x-www-form-urlencoded" \
-d "client_id=idp-client" \
-d "client_secret=idp-secret" \
-d "grant_type=client_credentials"
```

### 4. Call the Notes API

Use the token from above to call your secured endpoint:
```bash
curl -H "Authorization: Bearer <ACCESS_TOKEN>" \
  http://localhost:9090/api/notes
```
