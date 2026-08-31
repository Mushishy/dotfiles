# dotfiles

Personal dotfiles for macOS/Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each top-level folder is a stow "package" whose contents mirror the layout of
`$HOME`, so stowing a package just symlinks its files into place.

## Layout

```
dotfiles/
├── bash/.bashrc
├── zsh/.zshrc .zprofile
├── git/.gitconfig
├── vim/.vimrc
├── editorconfig/.editorconfig
├── ssh/.ssh/config              # template, real hosts but no secrets/keys
├── vscode/Library/Application Support/Code/User/settings.json, keybindings.json
├── docs/ssh.md                  # ssh/vpn/tunnel notes and snippets
├── config.local                 # gitignored - live ~/.ssh/config, kept for backup only
├── Brewfile                     # brew bundle: CLI tools + VS Code extensions
├── installed.txt                # brew bundle dump of /Applications, for reference
├── RectangleConfig.json         # exported Rectangle.app settings, imported manually
└── .stow.local.ignore           # tells stow which files never to symlink
```

## Setup on a new machine

```sh
git clone <this-repo> ~/dotfiles && cd ~/dotfiles
brew bundle                 # installs CLI tools + VS Code extensions from Brewfile
stow bash zsh git vim editorconfig ssh vscode
```

`stow <package>` symlinks that package's files into `$HOME` (e.g.
`bash/.bashrc` -> `~/.bashrc`). Run `stow -D <package>` to unlink, or
`stow -R <package>` to re-stow after edits. `.stow.local.ignore` keeps
top-level files like `README.md`, `Brewfile`, `installed.txt`, and `docs/`
from ever being treated as stow targets.

to copy all configurations over to new Mac machine use `Migration Assistant`

## SSH

See [docs/ssh.md](docs/ssh.md) for VPN/tunnel commands, proxy jumping, X11 and
port forwarding snippets, and how `ssh/.ssh/config` relates to `config.local`.

## Rectangle

Rectangle doesn't read its config from a fixed path, so `RectangleConfig.json`
isn't stowed - it's just an export kept for backup/reuse. To apply it on a
new machine: **Rectangle > Settings > General > Import** and pick this file.
Re-export the same way after changing shortcuts to keep it up to date.

## Maintenance

```sh
brew bundle dump --force              # refresh Brewfile from what's actually installed
ls /Applications > ./installed.txt    # refresh installed.txt
```
