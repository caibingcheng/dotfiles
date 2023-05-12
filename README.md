## Bing dotfiles

Your dotfiles are how you personalize your system. These are mine.

### install

Configure bash dotfiles:

```
curl https://raw.githubusercontent.com/caibingcheng/dotfiles/main/setup | bash -s bash
```

Configure zsh dotfiles:

```
curl https://raw.githubusercontent.com/caibingcheng/dotfiles/main/setup | bash -s zsh
```

### components

There's a few special files in the hierarchy.

- **setup**: Setup tool
- **aliases**: Common aliases, such as `alias gb="git branch"`
- **cmmrc**: Common rc
- **bin**: Some useful scripts
- **tag-zsh/\***: Configurations of zsh, all zsh-plugins are managed by `zinit`, some packages are recommended: `fzf/exa/ripgrep`
- **tag-bash/\***: Configurations of bash
