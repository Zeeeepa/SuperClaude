# SuperClaude for Cursor - Usage Guide

This guide explains how to use SuperClaude with Cursor IDE for enhanced AI-assisted development.

## 🚀 Quick Start

### Installation
```bash
git clone https://github.com/Zeeeepa/SuperClaude.git
cd SuperClaude
./install-cursor.sh
```

### First Steps
1. Open Cursor IDE
2. Open any project (or create a new one)
3. Try your first SuperClaude command:
   ```
   "Use SuperClaude build to create a React TypeScript application"
   ```

## 🎯 How SuperClaude Works in Cursor

SuperClaude integrates with Cursor's rule system (`.cursor/rules`) to provide:
- **19 specialized commands** for development workflows
- **9 cognitive personas** for domain-specific expertise
- **Evidence-based methodology** for reliable recommendations
- **Context-aware activation** based on your requests

### Rule Activation
SuperClaude rules activate when you:
- Mention "SuperClaude" followed by a command name
- Reference specific personas in your requests
- Use natural language that matches command patterns

## 📋 Available Commands

### Development Commands
| Command | Purpose | Example Usage |
|---------|---------|---------------|
| **build** | Project builder with stack templates | "Use SuperClaude build to create a React app with TypeScript" |
| **dev-setup** | Development environment configuration | "Apply SuperClaude dev-setup for CI/CD pipeline" |
| **test** | Comprehensive testing framework | "Run SuperClaude test with coverage analysis" |

### Analysis & Quality Commands
| Command | Purpose | Example Usage |
|---------|---------|---------------|
| **analyze** | Code and system analysis | "Use SuperClaude analyze to review this architecture" |
| **review** | AI-powered code review | "Apply SuperClaude review with security focus" |
| **troubleshoot** | Debugging and issue resolution | "Run SuperClaude troubleshoot for this performance issue" |
| **improve** | Enhancement and optimization | "Use SuperClaude improve for code quality" |
| **explain** | Documentation and explanations | "Apply SuperClaude explain to document this API" |

### Operations Commands
| Command | Purpose | Example Usage |
|---------|---------|---------------|
| **deploy** | Application deployment planning | "Use SuperClaude deploy for production strategy" |
| **migrate** | Database and code migrations | "Apply SuperClaude migrate for schema changes" |
| **scan** | Security and validation audits | "Run SuperClaude scan for vulnerability assessment" |
| **estimate** | Project estimation and planning | "Use SuperClaude estimate for feature development" |
| **cleanup** | Project maintenance tasks | "Apply SuperClaude cleanup for code optimization" |
| **git** | Git workflow management | "Use SuperClaude git for branch strategy" |

### Design & Workflow Commands
| Command | Purpose | Example Usage |
|---------|---------|---------------|
| **design** | System architecture planning | "Use SuperClaude design for microservices architecture" |
| **spawn** | Parallel task execution | "Apply SuperClaude spawn for concurrent development" |
| **document** | Documentation creation | "Run SuperClaude document for API documentation" |
| **load** | Project context loading | "Use SuperClaude load to understand this codebase" |
| **task** | Task management and tracking | "Apply SuperClaude task for project planning" |

## 🎭 Available Personas

### Technical Specialists
| Persona | Focus | Example Usage |
|---------|-------|---------------|
| **architect** | System design and architecture | "Take architect persona and design this API" |
| **security** | Security-first analysis | "Use security persona to review authentication" |
| **performance** | Optimization and tuning | "Apply performance persona for speed optimization" |
| **backend** | Server-side systems | "Use backend persona for database design" |
| **frontend** | UI/UX development | "Take frontend persona for React component" |

### Process Specialists
| Persona | Focus | Example Usage |
|---------|-------|---------------|
| **analyzer** | Problem-solving and debugging | "Use analyzer persona to investigate this bug" |
| **qa** | Quality assurance and testing | "Apply QA persona for test strategy" |
| **refactorer** | Code quality improvement | "Take refactorer persona to clean this code" |
| **mentor** | Knowledge sharing | "Use mentor persona to explain this pattern" |

## 💡 Usage Patterns

### Basic Command Usage
```
"Use SuperClaude [command] to [action]"
"Apply SuperClaude [command] for [purpose]"
"Run SuperClaude [command] with [options]"
```

### Persona Integration
```
"Use SuperClaude [command] with [persona] persona"
"Take [persona] persona and [action]"
"Apply [persona] persona to [task]"
```

### Combined Usage
```
"Use SuperClaude build with frontend persona for React TypeScript app"
"Apply SuperClaude review with security persona for authentication code"
"Run SuperClaude test with QA persona for comprehensive coverage"
```

## 🔧 Advanced Usage

### Project-Specific Configuration
SuperClaude rules are installed in `.cursor/rules` and can be customized:
- Edit individual command files for project-specific behavior
- Modify persona files to match team preferences
- Add custom rules for specialized workflows

### Global vs Project Installation
```bash
# Project installation (default)
./install-cursor.sh

# Global installation (all projects)
./install-cursor.sh --global
```

### Update and Maintenance
```bash
# Update existing installation
./install-cursor.sh --update

# Preview changes
./install-cursor.sh --dry-run --verbose

# Verify installation
./install-cursor.sh --verify
```

## 🎮 Example Workflows

### Full-Stack Development
```
1. "Use SuperClaude design with architect persona for e-commerce API"
2. "Apply SuperClaude build with backend persona for Node.js API"
3. "Use SuperClaude build with frontend persona for React storefront"
4. "Run SuperClaude test with QA persona for comprehensive testing"
5. "Apply SuperClaude deploy for staging environment"
```

### Code Quality Improvement
```
1. "Use SuperClaude analyze to assess current code quality"
2. "Apply SuperClaude review with security persona for vulnerability scan"
3. "Take refactorer persona and improve code structure"
4. "Run SuperClaude test to ensure quality improvements"
5. "Use SuperClaude document to update technical documentation"
```

### Performance Optimization
```
1. "Use SuperClaude analyze with performance persona for bottleneck identification"
2. "Apply SuperClaude troubleshoot for performance issue investigation"
3. "Take performance persona and optimize database queries"
4. "Run SuperClaude test for performance regression testing"
5. "Use SuperClaude monitor for ongoing performance tracking"
```

## 🛠️ Troubleshooting

### Rules Not Activating
1. Ensure SuperClaude is properly installed in `.cursor/rules`
2. Check that you're mentioning "SuperClaude" in your requests
3. Verify Cursor IDE is recognizing the rules directory
4. Try restarting Cursor IDE if rules aren't loading

### Command Not Working
1. Check the exact command name in `.cursor/rules/commands/`
2. Ensure you're using natural language activation
3. Try different phrasing: "Use SuperClaude [command]" or "Apply SuperClaude [command]"
4. Verify the command file exists and is properly formatted

### Persona Not Responding
1. Check persona files exist in `.cursor/rules/personas/`
2. Use clear persona references: "with [persona] persona" or "take [persona] persona"
3. Ensure persona names match file names (architect, security, frontend, etc.)
4. Try combining with commands for better activation

## 📚 Best Practices

### Effective Command Usage
- Be specific about your goals and requirements
- Mention relevant technologies and constraints
- Provide context about your project and team
- Ask for evidence-based recommendations

### Persona Selection
- Choose personas that match your current task
- Combine personas with relevant commands
- Use architect persona for high-level design
- Use security persona for security-critical code
- Use performance persona for optimization tasks

### Project Integration
- Commit `.cursor/rules` to version control
- Customize rules for team-specific practices
- Document team conventions in rule files
- Share successful patterns with team members

## 🔗 Additional Resources

- **Installation Help**: `./install-cursor.sh --help`
- **Command Reference**: `.cursor/rules/superclaude-index.md`
- **Individual Commands**: `.cursor/rules/commands/`
- **Persona Details**: `.cursor/rules/personas/`
- **GitHub Repository**: [https://github.com/Zeeeepa/SuperClaude](https://github.com/Zeeeepa/SuperClaude)

---

*Happy coding with SuperClaude and Cursor! 🚀*

