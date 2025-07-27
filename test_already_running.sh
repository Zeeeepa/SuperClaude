#!/bin/bash

# Test script to verify the "already running" fix works
echo "🧪 Testing Claude Code Router 'already running' scenario..."

# Make sure service is running first
echo "1. Starting CCR service..."
ccr start

# Wait a moment
sleep 2

# Now test our deployment script with service already running
echo "2. Running deployment script with service already running..."
bash comprehensive_deploy.sh

echo "✅ Test completed!"
