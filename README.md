## Bing dotfiles

Your dotfiles are how you personalize your system. These are mine.

### install

These dotfiles are managed by `rcm`. Run this to install:

```
git clone https://github.com/caibingcheng/dotfiles.git ~/.dotfiles
rcup -t rcm
rcup && rcup -t zsh
```

### components

There's a few special files in the hierarchy.

- **aliases**: Common aliases, such as `alias gb="git branch"`
- **tag-zsh/\***: Configurations of zsh, all zsh-plugins are managed by `zinit`, some packages are recommended: `fzf/exa/ripgrep`