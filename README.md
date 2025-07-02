# SuperClaude – Development Framework for Cursor IDE

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-3.0.0-blue.svg)](https://github.com/Zeeeepa/SuperClaude)
[![GitHub issues](https://img.shields.io/github/issues/Zeeeepa/SuperClaude)](https://github.com/Zeeeepa/SuperClaude/issues)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/Zeeeepa/SuperClaude/blob/master/CONTRIBUTING.md)

**A configuration framework that enhances Cursor IDE with specialized commands, cognitive personas, and development methodologies.**

## 🚀 Version 3.0.0 - Cursor IDE Adaptation

**MAJOR UPDATE**: SuperClaude now works with Cursor IDE instead of Claude Code!

SuperClaude v3 introduces complete Cursor IDE integration:

- **🎯 Cursor Native**: Built for Cursor's `.cursor/rules` system
- **🎭 Enhanced Personas**: 9 cognitive personas as individual rule files
- **📦 Smart Installation**: `install-cursor.sh` with project and global modes
- **🔧 Rule-Based Architecture**: Leverages Cursor's AI rule system
- **⚡ Natural Language Commands**: No more slash commands - use natural language
- **🎯 Context-Aware Activation**: Rules activate based on context and mentions

See [ROADMAP.md](ROADMAP.md) for future development ideas and contribution opportunities.

## 🎯 Background

Cursor IDE provides powerful AI-assisted development but can benefit from:
- **Specialized expertise** for different technical domains
- **Structured workflows** for complex projects  
- **Evidence-based approaches** to development
- **Context preservation** during development sessions
- **Domain-specific thinking** for various tasks

## ✨ SuperClaude Features

SuperClaude enhances Cursor IDE with:
- **18 Specialized Commands** covering development lifecycle tasks
- **9 Cognitive Personas** for domain-specific approaches
- **Token Optimization** with compression options
- **Evidence-Based Methodology** encouraging documentation
- **MCP Integration** with Context7, Sequential, Magic, Puppeteer
- **Git Checkpoint Support** for safe experimentation
- **Introspection Mode** for framework improvement and troubleshooting

## 🚀 Installation

### Cursor IDE Installation v3.0.0
The installer provides project and global installation options:

```bash
git clone https://github.com/Zeeeepa/SuperClaude.git
cd SuperClaude

# Project installation (recommended)
./install-cursor.sh                    # Installs to .cursor/rules

# Global installation
./install-cursor.sh --global          # Available in all projects

# Advanced options
./install-cursor.sh --update          # Update existing installation
./install-cursor.sh --dry-run --verbose # Preview changes with details
./install-cursor.sh --force           # Skip confirmations (automation)
./install-cursor.sh --log install.log # Log all operations
```

**v3.0.0 Installer Features:**
- 🎯 **Project Mode**: Install in current project's `.cursor/rules`
- 🌐 **Global Mode**: Install for all Cursor projects
- 🔄 **Update Mode**: Preserves customizations while updating
- 👁️ **Dry Run**: Preview changes before applying
- 💾 **Smart Backups**: Automatic backup with timestamping
- 🖥️ **Platform Detection**: Works with Linux, macOS, Windows
- 📊 **Progress Tracking**: Installation feedback

Zero dependencies. Installs to `.cursor/rules` by default.

**Note:** After installation, all rule files are located in `.cursor/rules` and are version-controlled with your project.

## 💡 Core Capabilities

### 🧠 **Cognitive Personas (Natural Language Activation!)**
Switch between different approaches using natural language:

```
"Use SuperClaude analyze with architect persona to review this system"
"Apply frontend persona to build this React component"  
"Take security persona and scan this authentication code"
"Use analyzer persona to troubleshoot this production issue"
```

**v3.0.0 Update**: All 9 personas are now individual rule files that activate through natural language mentions, providing specialized approaches contextually.

### ⚡ **19 Commands**
Development lifecycle coverage:

**Development Commands**
```
"Use SuperClaude build to create a React app with TypeScript and testing"
"Apply SuperClaude dev-setup for CI/CD pipeline configuration"
"Run SuperClaude test with comprehensive coverage and E2E testing"
```

**Analysis & Quality**
```
"Use SuperClaude review with QA persona for code quality analysis"
"Apply SuperClaude analyze to examine this system architecture"
"Run SuperClaude troubleshoot to resolve this production issue"
"Use SuperClaude improve for performance optimization"
"Apply SuperClaude explain to document this complex feature"
```

**Operations & Security**
```
"Use SuperClaude deploy to plan production deployment strategy"
"Apply SuperClaude scan with security persona for vulnerability assessment"
"Run SuperClaude migrate for database schema changes"
"Use SuperClaude cleanup to optimize project maintenance"
```

### 🎛️ **MCP Integration**
- **Context7**: Access to library documentation
- **Sequential**: Multi-step reasoning capabilities
- **Magic**: AI-generated UI components
- **Puppeteer**: Browser testing and automation

**⚠️ Important:** SuperClaude does not include MCP servers. You need to install them separately in Cursor's MCP settings to use MCP-related capabilities when available.

### 📊 **Token Efficiency**
SuperClaude's @include template system helps manage token usage:
- **UltraCompressed mode** option for token reduction
- **Template references** for configuration management
- **Caching mechanisms** to avoid redundancy
- **Context-aware compression** options

## 🎮 Example Workflows

### Enterprise Architecture Flow
```
"Use SuperClaude design with architect persona for API domain-driven design"
"Apply SuperClaude estimate for detailed resource planning and worst-case scenarios"
"Run SuperClaude scan with security persona for comprehensive security review"
"Use SuperClaude build with backend persona for TDD API implementation"
```

### Production Issue Resolution
```
"Use SuperClaude troubleshoot with analyzer persona to investigate production issues"
"Apply SuperClaude analyze for performance profiling and bottleneck identification"
"Run SuperClaude improve with performance persona for 95% optimization target"
"Use SuperClaude test for integration and end-to-end validation"
```

### Framework Troubleshooting & Improvement
```
"Use SuperClaude troubleshoot to debug development workflow issues"
"Apply SuperClaude analyze to examine code patterns and architecture"
"Run SuperClaude improve to optimize development processes and efficiency"
```

### Full-Stack Feature Development
```
"Use SuperClaude build with frontend persona for React UI development"
"Apply SuperClaude test with QA persona for comprehensive quality assurance"
"Run SuperClaude scan with security persona for dependency and security validation"
```

## 🎭 Available Personas

| Persona | Focus Area | Tools | Use Cases |
|---------|-----------|-------|-----------|
| **architect** | System design | Sequential, Context7 | Architecture planning |
| **frontend** | User experience | Magic, Puppeteer, Context7 | UI development |
| **backend** | Server systems | Context7, Sequential | API development |
| **security** | Security analysis | Sequential, Context7 | Security reviews |
| **analyzer** | Problem solving | All MCP tools | Debugging |
| **qa** | Quality assurance | Puppeteer, Context7 | Testing |
| **performance** | Optimization | Puppeteer, Sequential | Performance tuning |
| **refactorer** | Code quality | Sequential, Context7 | Code improvement |
| **mentor** | Knowledge sharing | Context7, Sequential | Documentation |

## 🛠️ Configuration Options

### Thinking Depth Control
```bash
# Standard analysis
/analyze --think

# Deeper analysis  
/design --think-hard

# Maximum depth
/troubleshoot --ultrathink
```

### Introspection Mode
```bash
# Enable self-aware analysis for SuperClaude improvement
/analyze --introspect

# Debug SuperClaude behavior
/troubleshoot --introspect --seq

# Optimize framework performance
/improve --introspect --persona-performance
```

### Token Management
```bash
# Standard mode
/build --react --magic

# With compression
/analyze --architecture --uc

# Native tools only
/scan --security --no-mcp
```

### Evidence-Based Development
SuperClaude encourages:
- Documentation for design decisions
- Testing for quality improvements
- Metrics for performance work
- Security validation for deployments
- Analysis for architectural choices

## 📋 Command Categories

### Development (3 Commands)
- `/build` - Project builder with stack templates
- `/dev-setup` - Development environment setup
- `/test` - Testing framework

### Analysis & Improvement (5 Commands)
- `/review` - AI-powered code review with evidence-based recommendations
- `/analyze` - Code and system analysis
- `/troubleshoot` - Debugging and issue resolution
- `/improve` - Enhancement and optimization
- `/explain` - Documentation and explanations

### Operations (6 Commands)
- `/deploy` - Application deployment
- `/migrate` - Database and code migrations
- `/scan` - Security and validation
- `/estimate` - Project estimation
- `/cleanup` - Project maintenance
- `/git` - Git workflow management

### Design & Workflow (5 Commands)
- `/design` - System architecture
- `/spawn` - Parallel task execution
- `/document` - Documentation creation
- `/load` - Project context loading
- `/task` - Task management

## 🔧 Technical Architecture v2

SuperClaude v2's architecture enables extensibility:

**🏗️ Modular Configuration**
- **CLAUDE.md** – Core configuration with @include references
- **.claude/shared/** – Centralized YAML templates
- **commands/shared/** – Reusable command patterns
- **@include System** – Template engine for configuration

**🎯 Unified Command System**
- **19 Commands** – Development lifecycle coverage
- **Flag Inheritance** – Universal flags on all commands
- **Persona Integration** – 9 cognitive modes as flags
- **Template Validation** �� Reference integrity checking

**📦 Architecture Benefits**
- **Single Source of Truth** – Centralized updates
- **Easy Extension** – Add new commands/flags
- **Consistent Behavior** – Unified flag handling
- **Reduced Duplication** – Template-based configuration

**✅ Quality Features**
- **Evidence-Based Approach** – Documentation encouraged
- **Research Integration** – Library documentation access
- **Error Recovery** – Graceful failure handling
- **Structured Output** – Organized file locations

## 📊 Comparison

| Aspect | Standard Claude Code | SuperClaude Framework |
|--------|---------------------|----------------------|
| **Expertise** | General responses | 9 specialized personas |
| **Commands** | Manual instructions | 18 workflow commands |
| **Context** | Session-based | Git checkpoint support |
| **Tokens** | Standard usage | Compression options |
| **Approach** | General purpose | Evidence-based |
| **Documentation** | As needed | Systematic approach |
| **Quality** | Variable | Validation patterns |
| **Integration** | Basic tools | MCP orchestration |

## 🔮 Use Cases

**Development Teams**
- Consistent approaches across domains
- Standardized workflows
- Evidence-based decisions
- Documentation practices

**Technical Leaders**
- Architecture reviews
- Performance optimization
- Code quality improvement
- Team knowledge sharing

**Operations**
- Deployment procedures
- Debugging workflows
- Security management
- Maintenance tasks

## 🎯 Suitability

**Good fit for:**
- ✅ Teams wanting consistent AI assistance
- ✅ Projects needing specialized approaches
- ✅ Evidence-based development practices
- ✅ Token-conscious workflows
- ✅ Domain-specific expertise needs

**May not suit:**
- ❌ Purely manual workflows
- ❌ Minimal configuration preferences
- ❌ Ad-hoc development styles
- ❌ Single-domain focus

## 🚦 Getting Started

1. **Install SuperClaude**
   ```bash
   git clone https://github.com/Zeeeepa/SuperClaude.git && cd SuperClaude && ./install-cursor.sh
   ```

2. **Validate Installation**
   ```
   "Use SuperClaude load to understand this project context"
   "Apply SuperClaude analyze to review this codebase"
   "Take architect persona and analyze this system architecture"
   ```

3. **Example Workflow**
   ```
   "Use SuperClaude design for API architecture with domain-driven design"
   "Apply SuperClaude build to implement this feature with TDD"
   "Run SuperClaude test with comprehensive coverage and E2E testing"
   "Use SuperClaude deploy to plan staging environment deployment"
   ```

## 🛟 Support

- **Installation Help**: Run `./install-cursor.sh --help`
- **Command Details**: Check `.cursor/rules/commands/`
- **Contributing**: See [CONTRIBUTING.md](CONTRIBUTING.md)
- **Issues**: [GitHub Issues](https://github.com/Zeeeepa/SuperClaude/issues)

## 🤝 Community

SuperClaude welcomes contributions:
- **New Personas** for specialized workflows
- **Commands** for domain-specific operations  
- **Patterns** for development practices
- **Integrations** for productivity tools

Join the community: [Discussions](https://github.com/Zeeeepa/SuperClaude/discussions)

## 📈 Version 3.0.0 Changes

**🎯 Cursor IDE Integration:**
- **Rule-Based Architecture**: Native `.cursor/rules` system
- **Natural Language Commands**: No more slash commands
- **Context-Aware Activation**: Smart rule triggering
- **Project Integration**: Version-controlled rules
- **Global Support**: Cross-project availability
- **Enhanced Installation**: Project and global modes

**📊 Framework Details:**
- **Commands**: 19 specialized commands
- **Personas**: 9 cognitive approaches
- **Rule Files**: Individual activation system
- **Methodology**: Evidence-based approach
- **Usage**: Cursor IDE development teams

## 🎉 Enhance Your Development

SuperClaude provides a structured approach to using Cursor IDE with specialized commands, personas, and development patterns.

---

*SuperClaude v3.0.0 – Development framework for Cursor IDE*

[⭐ Star on GitHub](https://github.com/Zeeeepa/SuperClaude) | [💬 Discussions](https://github.com/Zeeeepa/SuperClaude/discussions) | [🐛 Report Issues](https://github.com/Zeeeepa/SuperClaude/issues)
