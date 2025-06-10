#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status.

echo "Prowlarr MCP Service: Initializing..."

# Validate required environment variables
if [ -z "$PROWLARR_URL" ]; then
    echo "Error: PROWLARR_URL environment variable is required"
    exit 1
fi

if [ -z "$PROWLARR_API_KEY" ]; then
    echo "Error: PROWLARR_API_KEY environment variable is required"
    exit 1
fi

# Set defaults for MCP server configuration
export PROWLARR_MCP_HOST=${PROWLARR_MCP_HOST:-"0.0.0.0"}
export PROWLARR_MCP_PORT=${PROWLARR_MCP_PORT:-"9159"}
export PROWLARR_MCP_TRANSPORT=${PROWLARR_MCP_TRANSPORT:-"sse"}
export PROWLARR_LOG_LEVEL=${PROWLARR_LOG_LEVEL:-"INFO"}

echo "Prowlarr MCP Service: Configuration validated"
echo "  - PROWLARR_URL: $PROWLARR_URL"
echo "  - PROWLARR_API_KEY: ***SET***"
echo "  - MCP_HOST: $PROWLARR_MCP_HOST"
echo "  - MCP_PORT: $PROWLARR_MCP_PORT"
echo "  - MCP_TRANSPORT: $PROWLARR_MCP_TRANSPORT"
echo "  - LOG_LEVEL: $PROWLARR_LOG_LEVEL"

# Change to app directory (important for relative path handling)
cd /app

echo "Prowlarr MCP Service: Starting server..."
exec python3 prowlarr-mcp-server.py 