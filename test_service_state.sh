#!/bin/bash

# Service State Testing Script
# Tests if services are already running and handles gracefully

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Service State Testing${NC}"
echo "========================"

# Test Claude Code Router service state
echo -e "${BLUE}1. Testing Claude Code Router Service${NC}"
echo "------------------------------------"

CCR_PORT=3456
API_KEY="AIzaSyBXmhlHudrD4zXiv-5fjxi1gGG-_kdtaZ0"

# Check if service is running
echo -e "${YELLOW}Checking service status...${NC}"

if curl -s "http://127.0.0.1:$CCR_PORT/health" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Claude Code Router is running on port $CCR_PORT${NC}"
    
    # Test API functionality
    echo -e "${YELLOW}Testing API functionality...${NC}"
    response=$(curl -s -X POST "http://127.0.0.1:$CCR_PORT/v1/messages" \
        -H "Content-Type: application/json" \
        -H "x-api-key: $API_KEY" \
        -d '{
            "model": "gemini-2.5-flash",
            "max_tokens": 20,
            "messages": [{"role": "user", "content": "Test"}]
        }')
    
    if echo "$response" | jq -e '.content[0].text' > /dev/null 2>&1; then
        echo -e "${GREEN}✅ API is responding correctly${NC}"
        content=$(echo "$response" | jq -r '.content[0].text')
        echo "   Response: $content"
    else
        echo -e "${RED}❌ API not responding correctly${NC}"
        echo "   Error: $response"
    fi
    
    # Check process information
    echo -e "${YELLOW}Service process information:${NC}"
    if pgrep -f "ccr\|claude-code-router" > /dev/null; then
        pid=$(pgrep -f "ccr\|claude-code-router")
        echo "   PID: $pid"
        
        # Get memory usage
        if command -v ps > /dev/null 2>&1; then
            memory=$(ps -p $pid -o rss= 2>/dev/null | tr -d ' ')
            if [[ -n "$memory" ]]; then
                memory_mb=$((memory / 1024))
                echo "   Memory usage: ${memory_mb}MB"
            fi
        fi
        
        # Check how long it's been running
        if command -v ps > /dev/null 2>&1; then
            runtime=$(ps -p $pid -o etime= 2>/dev/null | tr -d ' ')
            if [[ -n "$runtime" ]]; then
                echo "   Runtime: $runtime"
            fi
        fi
    fi
    
else
    echo -e "${YELLOW}⚠️  Claude Code Router not running${NC}"
    echo -e "${YELLOW}Attempting to start service...${NC}"
    
    # Try to start the service
    if command -v ccr > /dev/null 2>&1; then
        ccr start &
        sleep 3
        
        # Check if it started successfully
        if curl -s "http://127.0.0.1:$CCR_PORT/health" > /dev/null 2>&1; then
            echo -e "${GREEN}✅ Service started successfully${NC}"
        else
            echo -e "${RED}❌ Failed to start service${NC}"
        fi
    else
        echo -e "${RED}❌ ccr command not found${NC}"
    fi
fi

echo

# Test configuration state
echo -e "${BLUE}2. Testing Configuration State${NC}"
echo "------------------------------"

echo -e "${YELLOW}Checking configuration files...${NC}"

# Check main config
if [[ -f "/root/.claude-code-router/config.json" ]]; then
    echo -e "${GREEN}✅ Main configuration found${NC}"
    
    # Validate JSON
    if jq . /root/.claude-code-router/config.json > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Configuration is valid JSON${NC}"
        
        # Check key fields
        providers=$(jq -r '.Providers | length' /root/.claude-code-router/config.json 2>/dev/null)
        router_rules=$(jq -r '.Router | keys | length' /root/.claude-code-router/config.json 2>/dev/null)
        
        echo "   Providers: $providers"
        echo "   Router rules: $router_rules"
        
        # Check API key is configured
        if jq -e '.APIKEY' /root/.claude-code-router/config.json > /dev/null 2>&1; then
            echo -e "${GREEN}✅ API key configured${NC}"
        else
            echo -e "${YELLOW}⚠️  No API key in configuration${NC}"
        fi
        
    else
        echo -e "${RED}❌ Configuration JSON is invalid${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Main configuration not found${NC}"
fi

# Check log file
if [[ -f "/root/.claude-code-router/ccr.log" ]]; then
    echo -e "${GREEN}✅ Log file exists${NC}"
    
    log_size=$(wc -c < /root/.claude-code-router/ccr.log)
    log_lines=$(wc -l < /root/.claude-code-router/ccr.log)
    
    echo "   Log size: $log_size bytes"
    echo "   Log lines: $log_lines"
    
    # Show recent log entries
    if [[ $log_lines -gt 0 ]]; then
        echo "   Recent entries:"
        tail -3 /root/.claude-code-router/ccr.log | sed 's/^/   /'
    fi
else
    echo -e "${YELLOW}⚠️  Log file not found${NC}"
fi

echo

# Summary
echo -e "${BLUE}3. Summary${NC}"
echo "----------"

# Calculate overall health score
health_score=0

# Service running (50 points)
if curl -s "http://127.0.0.1:$CCR_PORT/health" > /dev/null 2>&1; then
    health_score=$((health_score + 50))
    service_status="✅ Running"
else
    service_status="❌ Not running"
fi

# Configuration valid (50 points)
if [[ -f "/root/.claude-code-router/config.json" ]] && jq . /root/.claude-code-router/config.json > /dev/null 2>&1; then
    health_score=$((health_score + 50))
    config_status="✅ Valid"
else
    config_status="❌ Invalid/Missing"
fi

echo -e "${YELLOW}System Health Score: $health_score/100${NC}"
echo
echo "Component Status:"
echo "   Service: $service_status"
echo "   Configuration: $config_status"

if [[ $health_score -ge 80 ]]; then
    echo -e "${GREEN}🎉 System is healthy and ready${NC}"
elif [[ $health_score -ge 60 ]]; then
    echo -e "${YELLOW}⚡ System is mostly functional${NC}"
else
    echo -e "${RED}❌ System needs attention${NC}"
fi

echo
echo -e "${BLUE}🎯 Service State Testing Complete!${NC}"
