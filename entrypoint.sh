#!/bin/bash
set -e

mkdir -p "$(dirname "$OPENCLAW_CONFIG_PATH")"

# Always merge required settings into existing config (or create it)
# This ensures settings survive even if the gateway rewrites the config on first run
node -e "
  const fs = require('fs');
  const path = process.env.OPENCLAW_CONFIG_PATH;
  let config = {};
  try { config = JSON.parse(fs.readFileSync(path, 'utf8')); } catch(e) {}
  if (!config.gateway) config.gateway = {};
  if (!config.gateway.controlUi) config.gateway.controlUi = {};
  config.gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback = true;
  fs.writeFileSync(path, JSON.stringify(config, null, 2));
"

exec openclaw gateway run --allow-unconfigured --bind lan
