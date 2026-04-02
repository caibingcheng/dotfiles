# Dotfiles

Your dotfiles are how you personalize your system. These are mine, configured for Ubuntu.

## Quick Start

### One-line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/caibingcheng/dotfiles/main/bootstrap | bash -s minimal
```

Or for the full setup:

```bash
curl -fsSL https://raw.githubusercontent.com/caibingcheng/dotfiles/main/bootstrap | bash -s standard
```

## What's Included

### Core Components

| Component | Description |
|-----------|-------------|
| **bash/** | Shell configuration (aliases, functions, profile) |
| **bin/** | Custom scripts and utilities |
| **git/** | Git configuration with delta pager |
| **tmux/** | Terminal multiplexer configuration (oh-my-tmux) |
| **ssh/** | SSH client configuration |

### Modern Tools

| Component | Description |
|-----------|-------------|
| **starship/** | Cross-shell prompt (modern alternative to custom PS1) |
| **direnv/** | Directory-specific environment variables |
| **fzf/** | Interactive fuzzy finder scripts |
| **docker/** | Docker aliases and helper functions |
| **brew/** | Homebrew package definitions |
| **rust/** | Rust toolchain installation |
| **node/** | Node.js with nvm installation and maintenance |
| **opencode/** | Opencode agent configuration |

## Installation Levels

### Minimal (`minimal`)

Essential tools for development:
- Core packages (curl, git, vim, build-essential, python3)
- Homebrew
- Rust
- Node.js (with nvm)
- Base dotfiles configuration

### Standard (`standard`)

Full development environment (includes minimal):
- GNOME tweaks and GUI tools
- VS Code
- Microsoft Edge
- Additional Homebrew packages

## Structure

```
.
├── bash/              # Shell configurations
│   ├── bash_aliases   # Aliases and functions
│   ├── bash_profile   # Login shell configuration
│   ├── bashrc         # Interactive shell configuration
│   └── profile        # Environment variables and functions
├── bin/               # Custom scripts
│   ├── sf             # Interactive code search
│   └── ...
├── git/               # Git configuration
│   ├── gitconfig      # Git settings with delta
│   └── gitignore_global
├── tmux/              # Tmux configuration
├── starship/          # Starship prompt config
├── direnv/            # Direnv configuration
├── docker/            # Docker aliases
├── fzf/               # Fzf utility scripts
├── node/              # Node.js with nvm
│   ├── install        # Install nvm and Node.js LTS
│   ├── update         # Update and maintenance scripts
│   └── README.md      # Node.js usage documentation
├── lib/               # Shared library functions
├── bootstrap          # Main installation script
├── minimal            # Minimal installation
├── standard           # Standard installation
└── uninstall          # Uninstallation script
```

## Available Scripts

### In `bin/`

| Script | Description |
|--------|-------------|
| `repo_stats` | Git repository statistics |
| `sf` | Interactive code search with fzf + ripgrep |
| `oo` | OpenCode zellij session launcher |

### FZF Scripts (`fzf/`)

| Script | Description |
|--------|-------------|
| `fzf-git-branch` | Interactive git branch selector |
| `fzf-kill` | Interactive process killer |
| `fzf-apt` | Interactive apt package manager |
| `fzf-history` | Enhanced shell history search |

### Docker Aliases

| Alias | Command |
|-------|---------|
| `dcu` | `docker compose up -d` |
| `dcd` | `docker compose down` |
| `dcr` | `docker compose restart` |
| `dcl` | `docker compose logs -f` |
| `dps` | `docker ps` |
| `dex` | `docker exec -it` |
| `dlogs` | `docker logs -f` |
| `dshell` | Enter container shell |
| `dstats` | Show container resource usage |
| `dprune` | Clean up Docker resources |

### Node.js Scripts (`node/`)

| Script | Description |
|--------|-------------|
| `install` | Install nvm and Node.js LTS version |
| `update` | Update nvm, Node.js, and global packages |

#### Node.js Usage

```bash
# Install Node.js environment
source ~/.dotfiles/node/install

# Update everything
source ~/.dotfiles/node/update all

# Update specific components
source ~/.dotfiles/node/update nvm     # Update nvm only
source ~/.dotfiles/node/update node    # Update Node.js only
source ~/.dotfiles/node/update packages # Update global npm packages
source ~/.dotfiles/node/update cleanup # Remove old Node.js versions
source ~/.dotfiles/node/update status  # Show current status
```

#### Common nvm Commands

```bash
nvm install --lts        # Install latest LTS
nvm use --lts            # Switch to LTS
nvm alias default lts    # Set default version
nvm ls                   # List installed versions
nvm current              # Show current version
```

## Usage

### Bootstrap Options

```bash
./bootstrap [OPTIONS] [LEVEL]

Levels:
  minimal      Minimal configuration
  standard     Standard configuration (includes minimal)

Options:
  -c, --config-only   Only configure dotfiles, skip tool installation
  -u, --update        Force update/reinstall tools
  -h, --help          Show help

Examples:
  ./bootstrap                    # First time setup
  ./bootstrap minimal            # Install minimal tools
  ./bootstrap standard           # Install standard tools
  ./bootstrap -c                 # Update configs only
  ./bootstrap -u standard        # Force reinstall standard
```

### Uninstallation

```bash
# Preview what would be removed
./uninstall --dry-run

# Standard uninstall (keeps installed tools)
./uninstall

# Full uninstall including tools
./uninstall --full
```

### Individual Module Setup

Each module has its own setup script:

```bash
DOTFILES_ROOT="$HOME/.dotfiles"
source "$DOTFILES_ROOT/lib/common.sh"
source "$DOTFILES_ROOT/bash/setup"
source "$DOTFILES_ROOT/git/setup"
source "$DOTFILES_ROOT/starship/setup"
# etc.
```

## Customization

### Adding Aliases

Edit `bash/bash_aliases`:

```bash
alias myalias='mycommand'
```

### Starship Theme

Edit `starship/starship.toml`:

```toml
# Change prompt character
[character]
success_symbol = "[➜](bold green)"
error_symbol = "[✗](bold red)"
```

### Direnv Project Configuration

Create `.envrc` in your project:

```bash
# Load Python virtual environment
layout_python

# Or load Node
layout_node 18

# Custom environment variables
export API_KEY="secret"
```

Then allow it:
```bash
direnv allow
```

### FZF Scripts

Make fzf scripts available globally:

```bash
# Add to PATH in .bashrc
export PATH="$HOME/.dotfiles/fzf:$PATH"

# Then use:
fzf-git-branch -a    # Show all branches
fzf-kill -s 9        # Kill with signal 9
fzf-apt install      # Interactive apt install
```

## Key Features

### Git Integration

- **Delta**: Syntax-highlighted diffs
- **FZF functions**: Interactive branch selection, commit browser, stash management
- **Worktree support**: `gwa`, `gwl`, `gwr` aliases

### Shell Enhancements

- **Starship**: Modern, fast, customizable prompt
- **Zoxide**: Smarter `cd` command
- **FZF**: Fuzzy completion and search
- **Direnv**: Per-directory environment

### Development Tools

- **Opencode**: AI agent configuration
- **Tmux**: Oh-my-tmux with plugins (resurrect, continuum, cpu)
- **Tealdeer**: Fast tldr pages client

## CI/CD

GitHub Actions automatically tests:
- Bootstrap script syntax
- Shell script validity (shellcheck)
- Documentation completeness

See `.github/workflows/ci.yml`

## Requirements

- Ubuntu 20.04+ (primary target)
- Bash 4.0+
- curl
- git

## Notes

- Configurations are symlinked from `~/.dotfiles/` to `~/`
- Backups are created when replacing existing files (`.backup.YYYYMMDDHHMMSS`)
- Homebrew is installed to `/home/linuxbrew/.linuxbrew`
- Most tools support both Ubuntu APT and Homebrew

## License

MIT License - See LICENSE file
