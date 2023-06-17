## Bing dotfiles

Your dotfiles are how you personalize your system. These are mine.

### install

Configure bash dotfiles:

```bash
curl https://raw.githubusercontent.com/caibingcheng/dotfiles/main/setup | bash -s bash
# sudo
curl https://raw.githubusercontent.com/caibingcheng/dotfiles/main/setup | bash -s bash sudo
```

Configure zsh dotfiles:

```zsh
curl https://raw.githubusercontent.com/caibingcheng/dotfiles/main/setup | bash -s zsh
# sudo
curl https://raw.githubusercontent.com/caibingcheng/dotfiles/main/setup | bash -s zsh sudo
```

### components

There's a few special files in the hierarchy.

- **setup**: Setup tool
- **aliases**: Common aliases, such as `alias gb="git branch"`
- **cmmrc**: Common rc
- **bin**: Some useful scripts
- **tag-zsh/\***: Configurations of zsh, all zsh-plugins are managed by `zinit`
- **tag-bash/\***: Configurations of bash
