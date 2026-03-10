#!/usr/bin/env bash
# shellcheck shell=bash
#
# Shared library functions for dotfiles setup scripts
# Source this file at the beginning of setup scripts
#

# =============================================================================
# Logging Functions
# =============================================================================

log_info() {
    echo -e "\033[0;32m[INFO]\033[0m $1"
}

log_warn() {
    echo -e "\033[1;33m[WARN]\033[0m $1" >&2
}

log_error() {
    echo -e "\033[0;31m[ERROR]\033[0m $1" >&2
}

# =============================================================================
# Utility Functions
# =============================================================================

# Check if a command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Create a symbolic link, backing up existing file if necessary
safe_link() {
    local source="$1"
    local target="$2"

    if [[ -L "${target}" ]]; then
        # Remove existing symlink
        rm -f "${target}"
    elif [[ -f "${target}" || -d "${target}" ]]; then
        # Backup existing file/directory
        local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        log_warn "Backing up ${target} to ${backup}"
        mv "${target}" "${backup}"
    fi

    ln -sf "${source}" "${target}"
}

# Create directory if it doesn't exist
ensure_dir() {
    local dir="$1"
    if [[ ! -d "${dir}" ]]; then
        mkdir -p "${dir}"
    fi
}

# Check if running on the specified OS
is_os() {
    [[ "$(uname)" == "$1" ]]
}

# Check if running on Linux
is_linux() {
    is_os "Linux"
}

# Check if running on macOS
is_macos() {
    is_os "Darwin"
}

# =============================================================================
# Git Functions
# =============================================================================

# Check if a directory is a git repository
is_git_repo() {
    git -C "$1" rev-parse --git-dir &>/dev/null
}

# Get the root directory of a git repository
git_root() {
    git -C "${1:-.}" rev-parse --show-toplevel
}

# =============================================================================
# Package Manager Functions
# =============================================================================

# Check if apt-get is available
has_apt() {
    command_exists apt-get
}

# Check if brew is available
has_brew() {
    command_exists brew
}

# Safe apt-get install
apt_install() {
    if has_apt; then
        ${SUDO} apt-get install -y "$@"
    else
        log_error "apt-get not available"
        return 1
    fi
}

# Safe brew install
brew_install() {
    if has_brew; then
        brew install "$@"
    else
        log_error "brew not available"
        return 1
    fi
}

# =============================================================================
# Setup Helper Functions
# =============================================================================

# Link dotfiles from a module directory to home
link_dotfiles() {
    local module="$1"
    local source_dir="${DOTFILES_ROOT}/${module}"

    for file in "${source_dir}"/*; do
        # Skip setup scripts and directories
        [[ "$(basename "${file}")" == "setup" ]] && continue
        [[ "$(basename "${file}")" == "*" ]] && continue
        [[ -d "${file}" ]] && continue

        local target="${HOME}/.$(basename "${file}")"
        safe_link "${file}" "${target}"
    done
}

# Run setup for a module
setup_module() {
    local module="$1"
    local setup_script="${DOTFILES_ROOT}/${module}/setup"

    log_info "Configuring ${module}..."

    if [[ -f "${setup_script}" ]]; then
        # shellcheck source=/dev/null
        source "${setup_script}"
    else
        log_warn "No setup script found for ${module}"
    fi
}
