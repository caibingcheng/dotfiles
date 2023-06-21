## dotfiles

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
- **dependencies.txt**: Dependencies list, which will be installed by setup tool
- **os/\***: OS configurations
- **common/\***: Common configurations
- **bin/\***: Scripts
- **zsh/\***: zsh configurations
- **bash/\***: bash configurations
