# Changelog

All notable changes to SuperClaude will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.0] - 2025-01-02

### 🚀 MAJOR RELEASE - Cursor IDE Integration

**BREAKING CHANGES**: SuperClaude now targets Cursor IDE instead of Claude Code.

### Added
- **Cursor Native Architecture**: Complete integration with Cursor's `.cursor/rules` system
- **Natural Language Commands**: Replace slash commands with natural language activation
- **Rule-Based Personas**: Individual persona files that activate contextually
- **Project Installation Mode**: Install rules directly in project's `.cursor/rules`
- **Global Installation Mode**: Install rules for all Cursor projects
- **Enhanced Installation Script**: `install-cursor.sh` with project/global modes
- **Context-Aware Activation**: Rules activate based on mentions and context
- **Version-Controlled Rules**: Project rules are committed with your codebase

### Changed
- **Target Platform**: Migrated from Claude Code to Cursor IDE
- **Command Syntax**: Natural language instead of slash commands
- **Installation Directory**: `.cursor/rules` instead of `~/.claude/`
- **Activation Method**: Rule-based system instead of direct commands
- **Documentation**: Complete rewrite for Cursor IDE usage patterns
- **Repository URLs**: Updated to reflect new repository location

### Removed
- **Claude Code Support**: No longer compatible with Claude Code
- **Slash Command Syntax**: Replaced with natural language
- **@include System**: Simplified to individual rule files
- **Centralized Configuration**: Moved to distributed rule files

### Technical Details
- **19 Commands**: All commands adapted for Cursor's rule system
- **9 Personas**: Individual persona rule files with contextual activation
- **Installation Modes**: Project-specific and global installation options
- **Platform Support**: Linux, macOS, Windows compatibility
- **Backup System**: Automatic backup during updates and installations

### Migration Guide
Users migrating from v2.x should:
1. Uninstall previous SuperClaude installation
2. Install Cursor IDE if not already installed
3. Run `./install-cursor.sh` in desired project
4. Use natural language commands instead of slash syntax
5. Reference personas by name in requests

## [2.0.1] - 2025-06-26

### Added
- `--introspect` flag for framework self-analysis and improvement capabilities
- Enhanced SuperClaude identity declaration with mission statement

### Fixed
- Corrected file count reporting in install.sh verification process
- Resolved critical file copying issues in install.sh

## [2.0.0] - 2025-06-26

### Added
- Comprehensive security and robustness improvements to install.sh
- Optimize all 18 command files using @include reference system
- Commands cheat sheet documentation
- Custom installation directory support (#4)
- Community interaction files (CONTRIBUTING.md, CODE_OF_CONDUCT.md)
- MIT License

### Changed
- Complete migration to v2 with @include reference system
- Standardized @include reference system across all command files
- Migrated PERSONAS to flag system for Claude Code compliance
- Transformed README.md into engaging developer-friendly format
- Major optimization achieving 35% token reduction through template system & file consolidation
- Enhanced Task Management System - Adaptation of PR #5 (#7)

### Removed
- All hard claims, metrics, and numeric targets
- All references to user: and project: prefixes
- References to deleted scripts and pattern system

### Fixed
- Shared resources count in install.sh
- .gitignore configuration and removed logs/claudedocs from tracking

## [1.0.0] - 2025-06-22

### Added
- Initial release of SuperClaude v1.0.0 configuration framework
- Core configuration system with CLAUDE.md
- Command system with 18 optimized command files
- Shared resources and patterns
- Installation script (install.sh)
- Comprehensive documentation

---

*Note: This changelog was generated from git history. For detailed commit messages, run `git log`.*
