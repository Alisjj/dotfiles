# Dotfiles

My dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each tool has its own directory under `dotfiles/`. The directory structure mirrors where the config files should live in `$HOME`.

```
dotfiles/
├── nvim/
│   └── .config/
│       └── nvim/          → ~/.config/nvim/
├── tmux/
│   └── .tmux.conf         → ~/.tmux.conf
├── install.sh            # Bootstrap script for new machines
└── README.md
```

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/) - Package manager for dotfiles

### Installation

**macOS:**
```bash
brew install stow
```

**Ubuntu/Debian:**
```bash
sudo apt-get install stow
```

**Fedora/RHEL:**
```bash
sudo yum install stow
```

## Usage

### Fresh Install (on a new machine)

```bash
# Clone this repository
git clone https://github.com/Alisjj/dotfiles.git ~/dotfiles

# Run the bootstrap script
cd ~/dotfiles
./install.sh

# Install Neovim plugins (if using Neovim)
nvim +Lazy! sync
```

### Adding a new config

1. Move your config into `~/dotfiles/<package>/`
2. Stow will create the symlink automatically:

```bash
cd ~/dotfiles
stow -t ~ <package>
```

### Updating a config

Edit the file in `~/dotfiles/<package>/` - it's now a symlink to your home directory, so changes take effect immediately.

### Unstow a package

```bash
cd ~/dotfiles
stow -D -t ~ <package>
```

## Managing with Git

```bash
# Pull latest changes
cd ~/dotfiles
git pull

# Commit changes
git add .
git commit -m "Update config"
git push
```

## Tmux Keybindings

| Binding | Action |
|---|---|
| `C-a` | Prefix (unbound from `C-b`) |
| `C-a h/j/k/l` | Select pane left/down/up/right (repeatable) |
| `C-a H/J/K/L` | Resize pane by 5 (repeatable) |
| `C-a ^` | Jump to last window |
| `C-a f` | Fuzzy session switcher (requires `tmux-sessionizer`) |
| `C-a i` | Open cheat.sh in new window |
| `C-a D` | Open TODO.md in new window |
| `C-a r` | Reload tmux config |
| `C-a c` | New window |
| `C-a n/p` | Next/previous window |
| `C-a ,` | Rename window |
| `C-a \|` / `C-a -` | Split pane horizontally/vertically in pwd |
| `C-a %` / `C-a "` | Split pane horizontally/vertically |

## Notes

- `lazy-lock.json` is ignored in `.gitignore` as it's machine-specific
- OS-specific files (`.DS_Store`, etc.) are also ignored
- Yank in copy mode pipes to system clipboard via `pbcopy` (macOS)
