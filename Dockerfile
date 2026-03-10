FROM node:22-slim

# Install dependencies needed by the install script
RUN apt-get update && apt-get install -y curl bash && rm -rf /var/lib/apt/lists/*

# Install OpenClaw
RUN curl -fsSL https://openclaw.ai/install.sh | bash

# Set default state/config locations inside the container
ENV OPENCLAW_STATE_DIR=/data/state
ENV OPENCLAW_CONFIG_PATH=/data/config/openclaw.json

# Create data directories
RUN mkdir -p /data/state /data/config

# Expose the gateway port
EXPOSE 18789

# Persist state and config outside the container
VOLUME ["/data"]

CMD ["openclaw", "gateway", "start"]
