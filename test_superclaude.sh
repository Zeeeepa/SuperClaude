#!/bin/bash
# Test script for SuperClaude Complete System
echo "🧪 Testing SuperClaude Complete System..."

# Source environment
source ~/.claude-code-router.env

echo "1. Testing Claude Code Router with Gemini API..."
curl -X POST "http://127.0.0.1:3456/v1/messages" \
    -H "Content-Type: application/json" \
    -H "x-api-key: $GEMINI_API_KEY" \
    -d '{
        "model": "gemini-2.5-flash",
        "max_tokens": 50,
        "messages": [
            {
                "role": "user",
                "content": "Hello from SuperClaude system!"
            }
        ]
    }' | jq '.' 2>/dev/null || echo "Response received (jq not available for formatting)"

echo -e "\n2. Testing claude-agents..."
if [[ -d "$HOME/.claude/agents" ]]; then
    echo "✅ Agents installed:"
    ls -1 "$HOME/.claude/agents"/*.md 2>/dev/null | xargs -I {} basename {} .md | sed 's/^/   • /'
else
    echo "❌ No agents found"
fi

echo -e "\n3. Testing SuperClaude Framework..."
if [[ -f "$HOME/.superclaude/config.json" ]]; then
    echo "✅ SuperClaude Framework installed"
    echo "Available personas:"
    jq -r '.personas | keys[]' "$HOME/.superclaude/config.json" 2>/dev/null | sed 's/^/   • /'
else
    echo "❌ SuperClaude Framework not found"
fi

echo -e "\n4. Testing MCP servers..."
if command -v claude &> /dev/null; then
    echo "✅ Claude CLI available"
    claude mcp list 2>/dev/null || echo "No MCP servers configured"
else
    echo "❌ Claude CLI not available"
fi

echo -e "\n5. Service status:"
ccr status 2>/dev/null || echo "Service status unavailable"

echo -e "\n🎉 SuperClaude system test complete!"
