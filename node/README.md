# Node.js Development Environment

This module provides a complete Node.js development environment setup using nvm (Node Version Manager).

## What's Included

- **nvm**: Node Version Manager for managing multiple Node.js versions
- **Node.js LTS**: Latest Long-Term Support version
- **npm**: Latest npm version with mirror configuration for China
- **Global packages**: yarn, pnpm

## Installation

### Quick Install

```bash
# Source the install script
source ~/.dotfiles/node/install
```

### Or install nvm manually

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Source nvm
source ~/.nvm/nvm.sh

# Install Node.js LTS
nvm install --lts
nvm use --lts
nvm alias default lts
```

## Shell Configuration

Add the following to your `~/.bashrc`:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

## Update and Maintenance

### Update Everything

```bash
source ~/.dotfiles/node/update
```

### Selective Updates

```bash
# Update nvm only
source ~/.dotfiles/node/update nvm

# Update Node.js only
source ~/.dotfiles/node/update node

# Update global packages only
source ~/.dotfiles/node/update packages

# Cleanup old versions
source ~/.dotfiles/node/update cleanup

# Show status
source ~/.dotfiles/node/update status
```

### Manual Commands

```bash
# Update nvm itself
cd ~/.nvm && git fetch --tags && git checkout $(git describe --tags $(git rev-list --tags --max-count=1))

# Update Node.js to latest LTS
nvm install --lts --latest-npm
nvm alias default lts

# Update global packages
npm update -g

# Cleanup old versions
nvm uninstall <old-version>
```

## Common nvm Commands

```bash
# List installed versions
nvm ls

# List available LTS versions
nvm ls-remote --lts

# Install specific version
nvm install 18
nvm install 20

# Switch version (current shell only)
nvm use 18

# Set default version
nvm alias default 18

# Run command with specific version
nvm exec 18 node app.js

# Migrate global packages from old version
nvm reinstall-packages 16

# Check current version
nvm current
```

## npm Configuration

### Mirror Configuration (China)

```bash
# Use Taobao mirror
npm config set registry https://registry.npmmirror.com

# Or use official registry
npm config set registry https://registry.npmjs.org

# Check current registry
npm config get registry
```

### Useful npm Commands

```bash
# Update npm itself
npm install -g npm@latest

# List global packages
npm ls -g --depth=0

# Update all global packages
npm update -g

# Clear npm cache
npm cache clean --force

# Check outdated packages
npm outdated -g
```

## Troubleshooting

### nvm not found in new shell

Make sure you've added the nvm configuration to `~/.bashrc`:

```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

### Node.js version changes after restart

You need to set a default version:

```bash
nvm alias default lts
# or
nvm alias default 18
```

### Permission errors with npm

Never use `sudo` with npm. Instead:

```bash
# Option 1: Reinstall with nvm (recommended)
nvm reinstall-packages <old-version>

# Option 2: Fix permissions
sudo chown -R $(whoami) ~/.npm
```

### Slow downloads in China

Configure npm mirror:

```bash
npm config set registry https://registry.npmmirror.com
```

## Version Strategy

- **LTS (Long-Term Support)**: Recommended for production
  - Even numbers: 18, 20, 22, ...
  - 30 months support cycle
  
- **Current**: Latest features
  - Odd numbers: 19, 21, 23, ...
  - 6 months support cycle

For development, use the latest LTS version:

```bash
nvm install --lts
nvm use --lts
```

## Related Files

- `install` - Installation script
- `update` - Update and maintenance script