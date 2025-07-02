#!/bin/bash

# SuperClaude for Cursor Installation Script
# Installs SuperClaude configuration framework to enhance Cursor IDE
# Version: 3.0.0
# License: MIT
# Repository: https://github.com/Zeeeepa/SuperClaude

set -e  # Exit on error
set -o pipefail  # Exit on pipe failure

# Script version
readonly SCRIPT_VERSION="3.0.0"

# Constants
readonly REQUIRED_SPACE_KB=51200  # 50MB in KB
readonly MIN_BASH_VERSION=3

# Colors for output - detect terminal support
if [[ -t 1 ]] && [[ "$(tput colors 2>/dev/null)" -ge 8 ]]; then
    readonly GREEN='\033[0;32m'
    readonly YELLOW='\033[1;33m'
    readonly RED='\033[0;31m'
    readonly BLUE='\033[0;34m'
    readonly NC='\033[0m' # No Color
else
    readonly GREEN=''
    readonly YELLOW=''
    readonly RED=''
    readonly BLUE=''
    readonly NC=''
fi

# Default settings
INSTALL_MODE="project"  # project or global
FORCE_INSTALL=false
UPDATE_MODE=false
UNINSTALL_MODE=false
VERIFY_MODE=false
VERBOSE=false
DRY_RUN=false
LOG_FILE=""
VERIFICATION_FAILURES=0
ROLLBACK_ON_FAILURE=true
BACKUP_DIR=""
INSTALLATION_PHASE=false
TARGET_DIR=""

# Error tracking
ERROR_COUNT=0
WARNING_COUNT=0
ERROR_DETAILS=()
WARNING_DETAILS=()

# Original working directory
ORIGINAL_DIR=$(pwd)

# Function: log_error
log_error() {
    local message="$1"
    echo -e "${RED}ERROR: $message${NC}" >&2
    ERROR_DETAILS+=("$message")
    ((ERROR_COUNT++))
    [[ -n "$LOG_FILE" ]] && echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $message" >> "$LOG_FILE"
}

# Function: log_warning
log_warning() {
    local message="$1"
    echo -e "${YELLOW}WARNING: $message${NC}" >&2
    WARNING_DETAILS+=("$message")
    ((WARNING_COUNT++))
    [[ -n "$LOG_FILE" ]] && echo "[$(date '+%Y-%m-%d %H:%M:%S')] WARNING: $message" >> "$LOG_FILE"
}

# Function: log_info
log_info() {
    local message="$1"
    echo -e "${BLUE}INFO: $message${NC}"
    [[ -n "$LOG_FILE" ]] && echo "[$(date '+%Y-%m-%d %H:%M:%S')] INFO: $message" >> "$LOG_FILE"
}

# Function: log_success
log_success() {
    local message="$1"
    echo -e "${GREEN}SUCCESS: $message${NC}"
    [[ -n "$LOG_FILE" ]] && echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS: $message" >> "$LOG_FILE"
}

# Function: log_verbose
log_verbose() {
    local message="$1"
    [[ "$VERBOSE" = true ]] && echo -e "${BLUE}VERBOSE: $message${NC}"
    [[ -n "$LOG_FILE" ]] && echo "[$(date '+%Y-%m-%d %H:%M:%S')] VERBOSE: $message" >> "$LOG_FILE"
}

# Function: show_help
show_help() {
    cat << EOF
SuperClaude for Cursor Installation Script v$SCRIPT_VERSION

USAGE:
    $0 [OPTIONS]

DESCRIPTION:
    Installs SuperClaude configuration framework to enhance Cursor IDE with
    specialized commands, cognitive personas, and development methodologies.

OPTIONS:
    --project           Install in current project (.cursor/rules) [default]
    --global            Install globally for all Cursor projects
    --update            Update existing installation
    --uninstall         Remove SuperClaude installation
    --verify            Verify installation integrity
    --force             Skip confirmations (automation mode)
    --dry-run           Preview changes without applying
    --verbose           Enable detailed output
    --log FILE          Log operations to specified file
    --help              Show this help message

EXAMPLES:
    # Install in current project
    $0

    # Install globally for all projects
    $0 --global

    # Update existing installation
    $0 --update

    # Preview installation changes
    $0 --dry-run --verbose

    # Automated installation with logging
    $0 --force --log install.log

INSTALLATION MODES:
    Project Mode (default):
        - Installs to .cursor/rules in current directory
        - Project-specific configuration
        - Version controlled with your project

    Global Mode:
        - Installs to Cursor's global configuration
        - Available across all projects
        - Requires Cursor settings modification

REQUIREMENTS:
    - Cursor IDE installed
    - Bash 3.0 or higher
    - 50MB free disk space
    - Write permissions to target directory

For more information, visit: https://github.com/Zeeeepa/SuperClaude
EOF
}

# Function: check_requirements
check_requirements() {
    log_verbose "Checking system requirements..."

    # Check Bash version
    if [[ "${BASH_VERSION%%.*}" -lt $MIN_BASH_VERSION ]]; then
        log_error "Bash version $MIN_BASH_VERSION or higher required (current: $BASH_VERSION)"
        return 1
    fi

    # Check available disk space
    local available_space
    if command -v df >/dev/null 2>&1; then
        available_space=$(df . | awk 'NR==2 {print $4}')
        if [[ "$available_space" -lt $REQUIRED_SPACE_KB ]]; then
            log_error "Insufficient disk space. Required: ${REQUIRED_SPACE_KB}KB, Available: ${available_space}KB"
            return 1
        fi
    else
        log_warning "Cannot check disk space (df command not available)"
    fi

    # Check if we're in a git repository for project mode
    if [[ "$INSTALL_MODE" = "project" ]] && ! git rev-parse --git-dir >/dev/null 2>&1; then
        log_warning "Not in a git repository. SuperClaude rules won't be version controlled."
    fi

    log_verbose "System requirements check passed"
    return 0
}

# Function: determine_install_directory
determine_install_directory() {
    case "$INSTALL_MODE" in
        "project")
            TARGET_DIR="$PWD/.cursor/rules"
            log_verbose "Project installation mode: $TARGET_DIR"
            ;;
        "global")
            # Try to find Cursor's global configuration directory
            if [[ "$OSTYPE" == "darwin"* ]]; then
                TARGET_DIR="$HOME/Library/Application Support/Cursor/User/globalStorage/.cursor/rules"
            elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
                TARGET_DIR="$HOME/.config/Cursor/User/globalStorage/.cursor/rules"
            elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
                TARGET_DIR="$APPDATA/Cursor/User/globalStorage/.cursor/rules"
            else
                log_error "Unsupported operating system for global installation: $OSTYPE"
                return 1
            fi
            log_verbose "Global installation mode: $TARGET_DIR"
            ;;
        *)
            log_error "Invalid installation mode: $INSTALL_MODE"
            return 1
            ;;
    esac

    return 0
}

# Function: create_backup
create_backup() {
    if [[ ! -d "$TARGET_DIR" ]]; then
        log_verbose "No existing installation to backup"
        return 0
    fi

    BACKUP_DIR="${TARGET_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    log_verbose "Creating backup: $BACKUP_DIR"

    if [[ "$DRY_RUN" = true ]]; then
        log_info "[DRY RUN] Would create backup: $BACKUP_DIR"
        return 0
    fi

    if ! cp -r "$TARGET_DIR" "$BACKUP_DIR" 2>/dev/null; then
        log_error "Failed to create backup"
        return 1
    fi

    log_success "Backup created: $BACKUP_DIR"
    return 0
}

# Function: install_superclaude
install_superclaude() {
    log_info "Installing SuperClaude for Cursor..."
    INSTALLATION_PHASE=true

    # Create target directory
    if [[ "$DRY_RUN" = true ]]; then
        log_info "[DRY RUN] Would create directory: $TARGET_DIR"
    else
        mkdir -p "$TARGET_DIR" || {
            log_error "Failed to create target directory: $TARGET_DIR"
            return 1
        }
    fi

    # Copy SuperClaude files
    local source_dir=".cursor/rules"
    if [[ ! -d "$source_dir" ]]; then
        log_error "SuperClaude source directory not found: $source_dir"
        return 1
    fi

    if [[ "$DRY_RUN" = true ]]; then
        log_info "[DRY RUN] Would copy files from $source_dir to $TARGET_DIR"
        find "$source_dir" -type f -name "*.md" | while read -r file; do
            echo "  Would copy: $file"
        done
    else
        log_verbose "Copying SuperClaude files..."
        if ! cp -r "$source_dir"/* "$TARGET_DIR/" 2>/dev/null; then
            log_error "Failed to copy SuperClaude files"
            return 1
        fi
    fi

    # Set appropriate permissions
    if [[ "$DRY_RUN" = false ]]; then
        find "$TARGET_DIR" -type f -name "*.md" -exec chmod 644 {} \\; 2>/dev/null || {
            log_warning "Could not set file permissions"
        }
    fi

    log_success "SuperClaude installation completed"
    INSTALLATION_PHASE=false
    return 0
}

# Function: verify_installation
verify_installation() {
    log_info "Verifying SuperClaude installation..."

    local required_files=(
        "superclaude-core.md"
        "superclaude-index.md"
        "commands/build.md"
        "commands/analyze.md"
        "commands/test.md"
        "personas/architect.md"
        "personas/security.md"
        "personas/frontend.md"
    )

    local missing_files=()
    for file in "${required_files[@]}"; do
        if [[ ! -f "$TARGET_DIR/$file" ]]; then
            missing_files+=("$file")
        fi
    done

    if [[ ${#missing_files[@]} -gt 0 ]]; then
        log_error "Missing required files:"
        for file in "${missing_files[@]}"; do
            echo "  - $file"
        done
        return 1
    fi

    log_success "Installation verification passed"
    return 0
}

# Function: show_usage_instructions
show_usage_instructions() {
    cat << EOF

${GREEN}🎉 SuperClaude for Cursor Installation Complete!${NC}

${BLUE}📍 Installation Location:${NC} $TARGET_DIR

${BLUE}🚀 Getting Started:${NC}

1. ${YELLOW}Open Cursor IDE${NC}
2. ${YELLOW}Open any project${NC} (for project installation) or ${YELLOW}any file${NC} (for global installation)
3. ${YELLOW}Try these commands:${NC}

   ${GREEN}Basic Usage:${NC}
   • "Use SuperClaude build to create a React TypeScript app"
   • "Apply SuperClaude analyze to review this code architecture"
   • "Run SuperClaude test with comprehensive coverage"

   ${GREEN}With Personas:${NC}
   • "Take the architect persona and design this API"
   • "Use security persona to review this authentication code"
   • "Apply frontend persona to optimize this component"

${BLUE}📚 Available Commands:${NC}
   build, analyze, test, review, troubleshoot, improve, deploy,
   scan, migrate, cleanup, design, document, estimate, and more

${BLUE}🎭 Available Personas:${NC}
   architect, security, frontend, backend, analyzer, qa,
   performance, refactorer, mentor

${BLUE}📖 Documentation:${NC}
   • README.md - Complete usage guide
   • .cursor/rules/superclaude-index.md - Command reference
   • Individual command files in .cursor/rules/commands/

${BLUE}🔧 Configuration:${NC}
   SuperClaude rules are now active in Cursor and will enhance
   your AI interactions with specialized development expertise.

${GREEN}Happy coding with SuperClaude! 🚀${NC}

EOF
}

# Function: parse_arguments
parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --project)
                INSTALL_MODE="project"
                shift
                ;;
            --global)
                INSTALL_MODE="global"
                shift
                ;;
            --update)
                UPDATE_MODE=true
                shift
                ;;
            --uninstall)
                UNINSTALL_MODE=true
                shift
                ;;
            --verify)
                VERIFY_MODE=true
                shift
                ;;
            --force)
                FORCE_INSTALL=true
                shift
                ;;
            --dry-run)
                DRY_RUN=true
                shift
                ;;
            --verbose)
                VERBOSE=true
                shift
                ;;
            --log)
                LOG_FILE="$2"
                shift 2
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
    done
}

# Function: main
main() {
    echo -e "${BLUE}SuperClaude for Cursor Installer v$SCRIPT_VERSION${NC}"
    echo

    # Parse command line arguments
    parse_arguments "$@"

    # Initialize log file if specified
    if [[ -n "$LOG_FILE" ]]; then
        touch "$LOG_FILE" || {
            log_error "Cannot create log file: $LOG_FILE"
            exit 1
        }
        log_info "Logging to: $LOG_FILE"
    fi

    # Check system requirements
    if ! check_requirements; then
        exit 1
    fi

    # Determine installation directory
    if ! determine_install_directory; then
        exit 1
    fi

    # Handle different modes
    if [[ "$VERIFY_MODE" = true ]]; then
        verify_installation
        exit $?
    fi

    if [[ "$UNINSTALL_MODE" = true ]]; then
        log_error "Uninstall mode not yet implemented"
        exit 1
    fi

    # Create backup if updating
    if [[ "$UPDATE_MODE" = true ]] || [[ -d "$TARGET_DIR" ]]; then
        if ! create_backup; then
            exit 1
        fi
    fi

    # Install SuperClaude
    if ! install_superclaude; then
        exit 1
    fi

    # Verify installation
    if ! verify_installation; then
        exit 1
    fi

    # Show usage instructions
    if [[ "$DRY_RUN" = false ]]; then
        show_usage_instructions
    fi

    log_success "SuperClaude for Cursor installation completed successfully!"
}

# Cleanup on exit
cleanup() {
    local exit_code=$?
    cd "$ORIGINAL_DIR" 2>/dev/null || true
    exit $exit_code
}
trap cleanup EXIT INT TERM HUP QUIT

# Run main function
main "$@"

