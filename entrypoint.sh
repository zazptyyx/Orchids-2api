#!/bin/sh

# 从环境变量生成 config.json
cat > /app/config.json << EOF
{
  "port": "${PORT:-3002}",
  "store_mode": "redis",
  "redis_addr": "${REDIS_ADDR:-redis:6379}",
  "redis_password": "${REDIS_PASSWORD:-}",
  "redis_db": ${REDIS_DB:-0},
  "admin_user": "${ADMIN_USER:-admin}",
  "admin_pass": "${ADMIN_PASS:-admin123}",
  "admin_path": "${ADMIN_PATH:-/admin}",
  "admin_token": "${ADMIN_TOKEN:-}",
  "debug_enabled": ${DEBUG_ENABLED:-false},
  "proxy_http": "${PROXY_HTTP:-}",
  "proxy_https": "${PROXY_HTTPS:-}"
}
EOF

echo "Generated config.json:"
cat /app/config.json

exec ./server -config /app/config.json
