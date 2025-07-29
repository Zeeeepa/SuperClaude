#!/bin/bash
# Fix Claude Code Environment Variables
# This script properly configures Claude Code to work with the router

set -e

GEMINI_API_KEY="AIzaSyBXmhlHudrD4zXiv-5fjxi1gGG-_kdtaZ0"
CCR_PORT=3456

echo "🔧 Fixing Claude Code Environment Variables..."

# Method 1: Update Claude's configuration file directly
CLAUDE_CONFIG="$HOME/.claude.json"
if [[ -f "$CLAUDE_CONFIG" ]]; then
    echo "📝 Updating Claude configuration file..."
    
    # Backup original
    cp "$CLAUDE_CONFIG" "$CLAUDE_CONFIG.backup"
    
    # Update the configuration to use our router
    cat > "$CLAUDE_CONFIG" << EOF
{
  "apiKey": "$GEMINI_API_KEY",
  "apiBaseUrl": "http://127.0.0.1:$CCR_PORT",
  "timeout": 600000
}
EOF
    
    echo "✅ Updated $CLAUDE_CONFIG"
fi

# Method 2: Create a wrapper script that sets environment variables
cat > "$HOME/ccr-code" << 'EOF'
#!/bin/bash
# Claude Code Router Wrapper
# This ensures environment variables are set before launching Claude Code

# Source the environment file
if [[ -f "$HOME/.claude-code-router.env" ]]; then
    source "$HOME/.claude-code-router.env"
fi

# Set environment variables explicitly
export ANTHROPIC_API_KEY="AIzaSyBXmhlHudrD4zXiv-5fjxi1gGG-_kdtaZ0"
export ANTHROPIC_API_BASE_URL="http://127.0.0.1:3456"

# Debug: Show what we're setting
echo "🔧 Environment variables set:"
echo "   ANTHROPIC_API_KEY: ${ANTHROPIC_API_KEY:0:20}..."
echo "   ANTHROPIC_API_BASE_URL: $ANTHROPIC_API_BASE_URL"
echo ""

# Launch Claude Code
exec ccr code "$@"
EOF

chmod +x "$HOME/ccr-code"
echo "✅ Created wrapper script: $HOME/ccr-code"

# Method 3: Update shell profile to always source the environment
SHELL_PROFILE=""
if [[ -f "$HOME/.bashrc" ]]; then
    SHELL_PROFILE="$HOME/.bashrc"
elif [[ -f "$HOME/.zshrc" ]]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [[ -f "$HOME/.profile" ]]; then
    SHELL_PROFILE="$HOME/.profile"
fi

if [[ -n "$SHELL_PROFILE" ]]; then
    if ! grep -q "claude-code-router.env" "$SHELL_PROFILE"; then
        echo "" >> "$SHELL_PROFILE"
        echo "# Claude Code Router Environment (Auto-added)" >> "$SHELL_PROFILE"
        echo "if [[ -f \"\$HOME/.claude-code-router.env\" ]]; then" >> "$SHELL_PROFILE"
        echo "    source \"\$HOME/.claude-code-router.env\"" >> "$SHELL_PROFILE"
        echo "fi" >> "$SHELL_PROFILE"
        echo "✅ Updated $SHELL_PROFILE"
    fi
fi

# Method 4: Test the configuration
echo ""
echo "🧪 Testing configuration..."

# Test API directly
echo "1. Testing Claude Code Router API..."
RESPONSE=$(curl -s -X POST "http://127.0.0.1:$CCR_PORT/v1/messages" \
    -H "Content-Type: application/json" \
    -H "x-api-key: $GEMINI_API_KEY" \
    -d '{
        "model": "gemini-2.5-flash",
        "max_tokens": 20,
        "messages": [{"role": "user", "content": "Say OK"}]
    }' 2>/dev/null || echo "ERROR")

if [[ "$RESPONSE" == "ERROR" ]] || [[ -z "$RESPONSE" ]]; then
    echo "❌ API test failed"
else
    echo "✅ API test passed"
fi

# Test environment variables
echo ""
echo "2. Testing environment variables..."
source "$HOME/.claude-code-router.env"
if [[ -n "$ANTHROPIC_API_KEY" ]] && [[ -n "$ANTHROPIC_API_BASE_URL" ]]; then
    echo "✅ Environment variables loaded correctly"
    echo "   ANTHROPIC_API_KEY: ${ANTHROPIC_API_KEY:0:20}..."
    echo "   ANTHROPIC_API_BASE_URL: $ANTHROPIC_API_BASE_URL"
else
    echo "❌ Environment variables not loaded"
fi

echo ""
echo "🎯 How to use:"
echo "   Option 1: Use wrapper script: ./ccr-code"
echo "   Option 2: Source environment first: source ~/.claude-code-router.env && ccr code"
echo "   Option 3: Restart your terminal and use: ccr code"
echo ""
echo "✅ Claude Code environment fix completed!"

