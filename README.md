# OpenClaw

Personal LLM build powered by [OpenClaw](https://openclaw.ai). Runs a self-hosted AI gateway with a browser-based Control UI.

## Requirements

- Docker and Docker Compose

## Quick Start

```bash
# Build and start the container
docker compose up -d

# First-time setup (run once after first start)
docker compose exec openclaw openclaw onboard

# Open the Control UI
open http://127.0.0.1:18789
```

## Useful Commands

```bash
# View logs
docker compose logs -f

# Check gateway status
docker compose exec openclaw openclaw gateway status

# Stop the container
docker compose down
```

## Configuration

State and config are persisted in a Docker volume (`openclaw-data`) so your setup survives container restarts and rebuilds.

Override locations via environment variables in `docker-compose.yml`:

| Variable | Default |
|---|---|
| `OPENCLAW_STATE_DIR` | `/data/state` |
| `OPENCLAW_CONFIG_PATH` | `/data/config/openclaw.json` |
