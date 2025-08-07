# About DOCKERIZE NGINX API GATEWAY

Built on **Nginx + Docker**, this gateway is reusable across projects — just define your services in the config!

*"One gateway to route them all."*  
A production-ready, reusable API gateway that serves as the **single entry point** for all your services — whether monolithic or microservices. Handles routing, rate limiting, logging, and extensible security, so you don’t have to reinvent the wheel on every project.


## 🌍 Use Case

- ✅ You have multiple backend services (e.g., user, billing, auth)
- ✅ You want a central place to route all requests (API Gateway style)
- ✅ You need a repeatable, plug-n-play config across projects
- ✅ You want to deploy it via Docker and chill


## 🚀 Getting Started (2-Minute Setup)
1. 1. Clone the Repository
``
    git clone https://github.com/m4-programmer/dockerize-gateway.git; 
    cd dockerize-gateway ``
2. copy .env.example and set the necessary data u need i.e 
```bash
cp .env.example .env
```
 Then fill it with your values, e.g.:

```bash
CONTAINER_NAME=api-gateway
HOST_PORT=8080
```

3. copy the example nginx conf and tailor it to you need, be it for monolith or microservice use. i.e run ``cp docker/nginx/example.conf docker/nginx/default.conf``
4. edit the default.conf file and add as many service you want to put in the api gateway
5. run ``docker compose up -d`` . Boom!!! The gateway is live at [http://localhost:8080](http://localhost:8080). (you can use your domain name or server ip instead of localhost)


## 🎯 Project Goal

To provide a **plug-and-play API gateway** that can be:
- **Reused across any project** (personal, team, or enterprise)
- **Deployed in seconds** with minimal configuration
- **Scaled seamlessly** from monoliths to microservices
- **Maintained centrally** — no copy-pasting Nginx configs anymore

This is not just a reverse proxy — it’s your **infrastructure foundation** for consistent, secure, and observable API routing.

---

## ❓ The Problem It Solves

When building backend systems — especially microservices — teams often face:

| Problem | Without This Gateway | With This Gateway |
|-------|------------------------|--------------------|
| 🔁 Repeated Setup | Copy-paste Nginx configs across projects | One template, reused everywhere |
| 🚧 Inconsistent Routing | Ad-hoc `/api/service` rules | Standardized, documented routing |
| ⚠️ Missing Rate Limiting | No protection from abuse | Built-in per-IP throttling |
| 📞 Service Discovery | Hardcoded IPs or unclear proxy logic | Clean `upstream` + `location` blocks |
| 📊 Poor Observability | No centralized logs | Structured access/error logs |
| 🔐 Security Gaps | Auth added later (if at all) | Designed for pluggable security |
| 🧱 Monolith to Microservices | Hard to refactor routing | Smooth transition with same gateway |

This project eliminates that friction.

## 🧱 Architecture Overview
- Built on **Nginx (Alpine)** for lightweight, battle-tested performance
- Runs in **Docker**, isolated and portable
- Uses **Docker Compose** for easy orchestration
- Routes via **declarative Nginx config** (`default.conf`)
- All services must be on the **same Docker network** for discovery

> ✅ Works with:  
> - Monoliths (`/api → app:3000`)  
> - Microservices (`/api/users → users:3000`, `/api/orders → orders:4001`)  
> - Frontends (`/ → frontend`)  
> - External APIs (via proxy)

---
---

## 🔁 Making Changes? Here’s What to Do

| File Changed                     | Action Required                        | Why?                                      |
|----------------------------------|----------------------------------------|-------------------------------------------|
| `docker/nginx/default.conf`      | `make reload` or `make restart`       | NGINX needs to re-read its config         |
| `.env` or `docker-compose.yml`   | `make restart` or `docker compose up` | Docker doesn't auto-reload env/config     |
| Dockerfile or base image         | `docker compose build && up`          | Required for rebuilds                     |

---

## 🔄 Reload vs Restart vs Re-up

| Command                    | What it does                                    | Downtime |
|----------------------------|--------------------------------------------------|----------|
| `make reload`              | Hot reloads NGINX config (no container restart) | 🔥 None  |
| `make restart`             | Restarts the container                          | ⚠️ Minor |
| `docker compose up -d`     | Re-creates container if something changed       | ⚠️ Minor |

---

## 🧱 Project Structure

```
dockerize-gateway/
├── docker-compose.yml
├── .env
├── .env.example
├── .gitignore
├── Makefile
├── README.md
└── docker/
    └── nginx/
        ├── example.conf
        └── default.conf
```

---

## 🧠 Tips

- Use `.env` to manage container names and ports easily across environments
- You can copy this gateway into any project and just update the `default.conf`
- This is perfect for monoliths or microservices — just change the routes

---

## 🌱 Future Enhancements (optional)

- 🔐 SSL support with Let's Encrypt
- 🧪 JWT validation via Lua
- 🔒 Basic Auth for private services
- ⚖️ Load balancing
- 📊 Centralized access logging

---

## 🤝 Contribute

If you find this helpful, feel free to:

- ⭐ Star the repo
- 🛠️ Open a pull request
- 🗣️ Drop feedback

---

## 📄 License

MIT — go build cool stuff.