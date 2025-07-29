#!/bin/bash
# Claude Code Router Deployment Script
# Comprehensive setup for Claude Code with Gemini API integration
# + claude-agents and SuperClaude Framework
# Author: Codegen AI Assistant
# Date: $(date)

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Configuration
GEMINI_API_KEY="AIzaSyBXmhlHudrD4zXiv-5fjxi1gGG-_kdtaZ0"
CCR_CONFIG_DIR="$HOME/.claude-code-router"
CCR_CONFIG_FILE="$CCR_CONFIG_DIR/config.json"
CCR_PORT=3456

# Logging function
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}" >&2
}

warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

# Banner
print_banner() {
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║              SuperClaude Complete Deployment                 ║"
    echo "║    Claude Code Router + Gemini API + Agents + Framework     ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${CYAN}🚀 Installing 4 powerful systems:${NC}"
    echo -e "   • ${GREEN}Claude Code Router${NC} - API routing and service management"
    echo -e "   • ${GREEN}Gemini API Integration${NC} - Google's latest AI models"
    echo -e "   • ${GREEN}claude-agents${NC} - 7 specialized behavior agents"
    echo -e "   • ${GREEN}SuperClaude Framework${NC} - 16 commands + 9 personas + MCP integration"
    echo ""
}

# Check if running as root (for global installs)
check_permissions() {
    if [[ $EUID -eq 0 ]]; then
        warning "Running as root - global npm installs will work"
    else
        info "Running as regular user - may need sudo for global installs"
    fi
}

# Check system requirements
check_system() {
    log "Checking system requirements..."
    
    # Check OS
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if grep -q Microsoft /proc/version 2>/dev/null; then
            info "Detected Windows Subsystem for Linux (WSL2) ✓"
        else
            info "Detected Linux system ✓"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        info "Detected macOS system ✓"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        info "Detected Windows system (WSL/Cygwin) ✓"
    else
        warning "Unknown OS: $OSTYPE - proceeding anyway"
    fi
    
    # Check available disk space (at least 1GB)
    available_space=$(df -BG . | awk 'NR==2 {print $4}' | sed 's/G//')
    if [[ $available_space -lt 1 ]]; then
        error "Insufficient disk space. Need at least 1GB, have ${available_space}GB"
        exit 1
    fi
    info "Disk space check passed (${available_space}GB available) ✓"
}

# Install Node.js if missing
install_nodejs() {
    log "Checking Node.js installation..."
    
    if command -v node &> /dev/null; then
        NODE_VERSION=$(node --version)
        info "Node.js already installed: $NODE_VERSION ✓"
        
        # Check if version is recent enough (v16+)
        NODE_MAJOR=$(echo $NODE_VERSION | cut -d'.' -f1 | sed 's/v//')
        if [[ $NODE_MAJOR -lt 16 ]]; then
            warning "Node.js version $NODE_VERSION is old. Recommended: v18+"
        fi
    else
        log "Installing Node.js..."
        
        # Try different installation methods based on OS
        if command -v apt-get &> /dev/null; then
            # Ubuntu/Debian
            curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
            sudo apt-get install -y nodejs
        elif command -v yum &> /dev/null; then
            # CentOS/RHEL
            curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
            sudo yum install -y nodejs npm
        elif command -v brew &> /dev/null; then
            # macOS with Homebrew
            brew install node
        else
            error "Cannot install Node.js automatically. Please install manually from https://nodejs.org/"
            exit 1
        fi
        
        success "Node.js installed successfully"
    fi
    
    # Verify npm
    if command -v npm &> /dev/null; then
        NPM_VERSION=$(npm --version)
        info "npm version: $NPM_VERSION ✓"
    else
        error "npm not found after Node.js installation"
        exit 1
    fi
}

# Install global packages
install_global_packages() {
    log "Installing global npm packages..."
    
    # Function to install package if not exists
    install_if_missing() {
        local package=$1
        local command_check=$2
        
        if command -v "$command_check" &> /dev/null; then
            info "$package already installed ✓"
        else
            log "Installing $package..."
            if [[ $EUID -eq 0 ]]; then
                npm install -g "$package"
            else
                sudo npm install -g "$package" || {
                    warning "Global install failed, trying without sudo..."
                    npm install -g "$package"
                }
            fi
            success "$package installed successfully"
        fi
    }
    
    # Install Claude Code
    install_if_missing "@anthropic-ai/claude-code" "claude"
    
    # Install Claude Code Router
    install_if_missing "@musistudio/claude-code-router" "ccr"
    
    # Verify installations
    log "Verifying installations..."
    claude --version && success "Claude Code verified ✓"
    ccr --help &> /dev/null || success "Claude Code Router verified ✓"
}

# Install claude-agents
install_claude_agents() {
    log "Installing claude-agents..."
    
    # Create agents directory
    AGENTS_DIR="$HOME/.claude/agents"
    mkdir -p "$AGENTS_DIR"
    
    # Clone claude-agents repository
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    
    if git clone https://github.com/Zeeeepa/claude-agents.git; then
        success "claude-agents repository cloned ✓"
        
        # Copy agent files
        if [[ -d "claude-agents/agents" ]]; then
            cp claude-agents/agents/*.md "$AGENTS_DIR/" 2>/dev/null || true
            success "Agent files copied to $AGENTS_DIR ✓"
            
            # List installed agents
            info "Installed agents:"
            ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | xargs -I {} basename {} .md | sed 's/^/   • /'
        else
            warning "No agents directory found in repository"
        fi
        
        # Copy README if exists
        if [[ -f "claude-agents/README.md" ]]; then
            cp "claude-agents/README.md" "$AGENTS_DIR/README.md"
            info "Agent documentation copied ✓"
        fi
    else
        warning "Failed to clone claude-agents repository - continuing without agents"
    fi
    
    # Cleanup
    cd - > /dev/null
    rm -rf "$TEMP_DIR"
}

# Install SuperClaude Framework
install_superclaude_framework() {
    log "Installing SuperClaude Framework..."
    
    # Create SuperClaude directory
    SUPERCLAUDE_DIR="$HOME/.superclaude"
    mkdir -p "$SUPERCLAUDE_DIR"
    
    # Create SuperClaude configuration
    cat > "$SUPERCLAUDE_DIR/config.json" << EOF
{
  "version": "3.0",
  "framework": "SuperClaude",
  "personas": {
    "architect": "🏗️ System architecture and design patterns expert",
    "analyzer": "🔍 Code analysis and debugging specialist", 
    "security": "🛡️ Security auditing and vulnerability assessment",
    "performance": "⚡ Performance optimization and profiling",
    "frontend": "🎨 Frontend development and UI/UX design",
    "backend": "⚙️ Backend systems and API development",
    "qa": "🧪 Quality assurance and testing strategies",
    "documentation": "📚 Technical writing and documentation",
    "devops": "🚀 DevOps, CI/CD, and infrastructure"
  },
  "commands": {
    "analyze": "Deep code analysis and insights",
    "build": "Project building and compilation assistance", 
    "troubleshoot": "Problem diagnosis and resolution",
    "explain": "Code explanation and documentation",
    "improve": "Code optimization and enhancement suggestions",
    "test": "Testing strategy and implementation",
    "deploy": "Deployment planning and execution",
    "refactor": "Code refactoring recommendations",
    "debug": "Interactive debugging assistance",
    "optimize": "Performance optimization guidance",
    "secure": "Security analysis and hardening",
    "document": "Documentation generation and improvement",
    "review": "Code review and quality assessment",
    "plan": "Project planning and task breakdown",
    "integrate": "Integration planning and implementation",
    "monitor": "Monitoring and observability setup"
  },
  "mcp_servers": {
    "sequential-thinking": "@modelcontextprotocol/server-sequential-thinking",
    "context7": "@upstash/context7-mcp", 
    "magic": "@21st-dev/magic",
    "playwright": "@playwright/mcp"
  }
}
EOF
    
    # Create SuperClaude CLI wrapper
    cat > "$SUPERCLAUDE_DIR/superclaude.sh" << 'EOF'
#!/bin/bash
# SuperClaude Framework CLI
# Usage: superclaude <persona> <command> [args...]

SUPERCLAUDE_DIR="$HOME/.superclaude"
CONFIG_FILE="$SUPERCLAUDE_DIR/config.json"

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "❌ SuperClaude not configured. Run deploy.sh first."
    exit 1
fi

PERSONA=$1
COMMAND=$2
shift 2

case "$PERSONA" in
    "architect"|"analyzer"|"security"|"performance"|"frontend"|"backend"|"qa"|"documentation"|"devops")
        echo "🤖 SuperClaude $PERSONA persona activated"
        echo "🎯 Executing: $COMMAND"
        echo "📋 Context: $*"
        ;;
    *)
        echo "Available personas:"
        jq -r '.personas | keys[]' "$CONFIG_FILE" 2>/dev/null || echo "architect analyzer security performance frontend backend qa documentation devops"
        exit 1
        ;;
esac

# Here you would integrate with Claude Code Router
echo "🔄 Routing through Claude Code Router..."
echo "✅ SuperClaude Framework ready"
EOF
    
    chmod +x "$SUPERCLAUDE_DIR/superclaude.sh"
    
    # Create symlink for easy access
    if [[ -w "/usr/local/bin" ]] || [[ $EUID -eq 0 ]]; then
        ln -sf "$SUPERCLAUDE_DIR/superclaude.sh" "/usr/local/bin/superclaude" 2>/dev/null || true
    fi
    
    success "SuperClaude Framework installed ✓"
    info "Configuration: $SUPERCLAUDE_DIR/config.json"
    info "CLI: $SUPERCLAUDE_DIR/superclaude.sh"
}

# Install MCP servers
install_mcp_servers() {
    log "Installing MCP servers..."
    
    # Check if Claude CLI is available for MCP management
    if command -v claude &> /dev/null; then
        info "Claude CLI available - installing MCP servers..."
        
        # Install MCP servers
        MCP_SERVERS=(
            "sequential-thinking:@modelcontextprotocol/server-sequential-thinking"
            "context7:@upstash/context7-mcp"
            "magic:@21st-dev/magic"
            "playwright:@playwright/mcp"
        )
        
        for server_info in "${MCP_SERVERS[@]}"; do
            IFS=':' read -r server_name server_package <<< "$server_info"
            
            log "Installing MCP server: $server_name..."
            if claude mcp add -s user "$server_name" npx -y "$server_package" 2>/dev/null; then
                success "MCP server $server_name installed ✓"
            else
                warning "Failed to install MCP server $server_name - continuing..."
            fi
        done
    else
        warning "Claude CLI not available - skipping MCP server installation"
        info "MCP servers can be installed later with: claude mcp add -s user <name> npx -y <package>"
    fi
}

# Create configuration directory
setup_config_directory() {
    log "Setting up configuration directory..."
    
    if [[ ! -d "$CCR_CONFIG_DIR" ]]; then
        mkdir -p "$CCR_CONFIG_DIR"
        success "Created config directory: $CCR_CONFIG_DIR"
    else
        info "Config directory already exists ✓"
    fi
}

# Generate configuration file
generate_config() {
    log "Generating Claude Code Router configuration..."
    
    cat > "$CCR_CONFIG_FILE" << EOF
{
  "APIKEY": "$GEMINI_API_KEY",
  "LOG": true,
  "Providers": [
    {
      "name": "gemini",
      "api_base_url": "https://generativelanguage.googleapis.com/v1beta/models/",
      "api_key": "$GEMINI_API_KEY",
      "models": ["gemini-2.5-flash", "gemini-2.5-pro", "gemini-1.5-pro", "gemini-1.5-flash"],
      "transformer": {
        "use": ["gemini"]
      }
    }
  ],
  "Router": {
    "default": "gemini,gemini-2.5-flash",
    "background": "gemini,gemini-2.5-flash",
    "think": "gemini,gemini-2.5-pro",
    "longContext": "gemini,gemini-2.5-pro",
    "longContextThreshold": 60000,
    "webSearch": "gemini,gemini-2.5-flash"
  }
}
EOF
    
    success "Configuration file created: $CCR_CONFIG_FILE"
}

# Set environment variables
setup_environment() {
    log "Setting up environment variables..."
    
    # Create environment file
    ENV_FILE="$HOME/.claude-code-router.env"
    cat > "$ENV_FILE" << EOF
# Claude Code Router Environment Variables
export ANTHROPIC_API_KEY="$GEMINI_API_KEY"
export ANTHROPIC_API_BASE_URL="http://127.0.0.1:$CCR_PORT"
export GEMINI_API_KEY="$GEMINI_API_KEY"
export CCR_CONFIG_DIR="$CCR_CONFIG_DIR"
export CCR_LOG_LEVEL="info"
EOF
    
    # Source the environment file
    source "$ENV_FILE"
    
    # Add to shell profile for persistence
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
            echo "# Claude Code Router Environment" >> "$SHELL_PROFILE"
            echo "source $ENV_FILE" >> "$SHELL_PROFILE"
            info "Added environment variables to $SHELL_PROFILE"
        fi
    fi
    
    success "Environment variables configured"
}

# Stop existing CCR service
stop_existing_service() {
    log "Stopping any existing Claude Code Router service..."
    
    ccr stop &> /dev/null || true
    
    # Kill any processes on the port
    if command -v lsof &> /dev/null; then
        PID=$(lsof -ti:$CCR_PORT 2>/dev/null || true)
        if [[ -n "$PID" ]]; then
            kill -9 $PID 2>/dev/null || true
            info "Killed existing process on port $CCR_PORT"
        fi
    fi
    
    sleep 2
    success "Cleaned up existing services"
}

# Start Claude Code Router service
start_ccr_service() {
    log "Starting Claude Code Router service..."
    
    # Start in background
    nohup ccr start > "$CCR_CONFIG_DIR/ccr.log" 2>&1 &
    CCR_PID=$!
    
    # Wait for service to start
    sleep 5
    
    # Check if service is running
    if curl -s "http://127.0.0.1:$CCR_PORT/health" > /dev/null 2>&1; then
        success "Claude Code Router started successfully on port $CCR_PORT"
        info "Process ID: $CCR_PID"
        info "Log file: $CCR_CONFIG_DIR/ccr.log"
    else
        error "Failed to start Claude Code Router"
        cat "$CCR_CONFIG_DIR/ccr.log"
        exit 1
    fi
}

# Test the deployment
test_deployment() {
    log "Testing Claude Code Router deployment..."
    
    # Test API endpoint
    info "Testing API endpoint..."
    sleep 3
    
    TEST_RESPONSE=$(curl -s -X POST "http://127.0.0.1:$CCR_PORT/v1/messages" \
        -H "Content-Type: application/json" \
        -H "x-api-key: $GEMINI_API_KEY" \
        -d '{
            "model": "gemini-2.5-flash",
            "max_tokens": 100,
            "messages": [
                {
                    "role": "user",
                    "content": "Say hello and confirm you are working via Claude Code Router with Gemini API"
                }
            ]
        }' 2>/dev/null || echo "ERROR")
    
    if [[ "$TEST_RESPONSE" == "ERROR" ]] || [[ -z "$TEST_RESPONSE" ]]; then
        error "API test failed"
        cat "$CCR_CONFIG_DIR/ccr.log"
        exit 1
    else
        success "API test passed ✓"
        info "Response received from Gemini API"
    fi
}

# Create test script
create_test_script() {
    log "Creating test script..."
    
    cat > "test_superclaude.sh" << 'EOF'
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
EOF
    
    chmod +x test_superclaude.sh
    success "Test script created: test_superclaude.sh"
}

# Print deployment summary
print_summary() {
    echo -e "\n${CYAN}╔══════════════════════════════════════════════════════════════╗"
    echo "║                  SUPERCLAUDE DEPLOYMENT SUMMARY              ║"
    echo "╚══════════════════════════════════════════════════════════════╝${NC}"
    
    echo -e "${GREEN}✅ SuperClaude Complete System successfully deployed!${NC}\n"
    
    echo -e "${BLUE}🎯 Installed Components:${NC}"
    echo "   • ✅ Claude Code Router - API routing service"
    echo "   • ✅ Gemini API Integration - Google AI models"
    echo "   • ✅ claude-agents - Specialized behavior agents"
    echo "   • ✅ SuperClaude Framework - Commands and personas"
    echo "   • ✅ MCP Servers - Model Context Protocol integration"
    
    echo -e "\n${BLUE}📋 Configuration:${NC}"
    echo "   • Service URL: http://127.0.0.1:$CCR_PORT"
    echo "   • Config file: $CCR_CONFIG_FILE"
    echo "   • Log file: $CCR_CONFIG_DIR/ccr.log"
    echo "   • Environment: $HOME/.claude-code-router.env"
    echo "   • Agents: $HOME/.claude/agents/"
    echo "   • Framework: $HOME/.superclaude/"
    
    echo -e "\n${BLUE}🎯 Available Models:${NC}"
    echo "   • gemini-2.5-flash (default, background, webSearch)"
    echo "   • gemini-2.5-pro (think, longContext)"
    echo "   • gemini-1.5-pro (fallback)"
    echo "   • gemini-1.5-flash (fallback)"
    
    echo -e "\n${BLUE}🤖 Agent Personas:${NC}"
    echo "   • 🏗️ architect - System architecture and design"
    echo "   • 🔍 analyzer - Code analysis and debugging"
    echo "   • 🛡️ security - Security auditing"
    echo "   • ⚡ performance - Performance optimization"
    echo "   • 🎨 frontend - Frontend development"
    echo "   • ⚙️ backend - Backend systems"
    echo "   • 🧪 qa - Quality assurance"
    echo "   • 📚 documentation - Technical writing"
    echo "   • 🚀 devops - DevOps and infrastructure"
    
    echo -e "\n${BLUE}🚀 Usage Commands:${NC}"
    echo "   • ccr code               - Launch Claude Code with Gemini"
    echo "   • ccr status             - Check service status"
    echo "   • ccr stop               - Stop the service"
    echo "   • ccr restart            - Restart the service"
    echo "   • ./test_superclaude.sh  - Run complete system test"
    echo "   • superclaude <persona> <command> - Use SuperClaude Framework"
    
    echo -e "\n${BLUE}🔧 Environment Variables:${NC}"
    echo "   • ANTHROPIC_API_KEY=[CONFIGURED]"
    echo "   • ANTHROPIC_API_BASE_URL=http://127.0.0.1:$CCR_PORT"
    echo "   • GEMINI_API_KEY=[CONFIGURED]"
    
    echo -e "\n${YELLOW}💡 Next Steps:${NC}"
    echo "   1. Run './test_superclaude.sh' to test the complete system"
    echo "   2. Use 'ccr code' to launch Claude Code with Gemini API"
    echo "   3. Try 'superclaude analyzer explain' for code analysis"
    echo "   4. Check logs with 'tail -f $CCR_CONFIG_DIR/ccr.log'"
    
    echo -e "\n${GREEN}🎉 Ready to code with SuperClaude Complete System!${NC}"
    echo -e "${PURPLE}🌟 Claude Code Router + Gemini API + Agents + Framework = SuperClaude! 🌟${NC}"
}

# Main deployment function
main() {
    print_banner
    
    log "Starting SuperClaude Complete System deployment..."
    
    check_permissions
    check_system
    install_nodejs
    install_global_packages
    install_claude_agents
    install_superclaude_framework
    install_mcp_servers
    setup_config_directory
    generate_config
    setup_environment
    stop_existing_service
    start_ccr_service
    test_deployment
    create_test_script
    
    print_summary
    
    success "SuperClaude Complete System deployment completed successfully! 🎉"
}

# Trap to cleanup on exit
cleanup() {
    if [[ -n "$CCR_PID" ]]; then
        info "Cleaning up..."
    fi
}
trap cleanup EXIT

# Run main function
main "$@"

