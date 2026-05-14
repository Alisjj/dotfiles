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

## Neovim Keybindings

### General

| Binding | Action |
|---|---|
| `<leader>` | Space |
| `<leader>pv` | Open file explorer (netrw) |
| `J` | Join lines, keep cursor in place |
| `J` (visual) | Move selected lines down |
| `K` (visual) | Move selected lines up |
| `<C-d>` | Half-page down, center screen |
| `<C-u>` | Half-page up, center screen |
| `n` / `N` | Search next/prev, center screen |
| `<leader>p` (visual) | Paste over selection without losing clipboard |
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>d` | Delete to void register |
| `<C-c>` (insert) | Escape |
| `Q` | Disabled |
| `<C-k>` / `<C-j>` | Quickfix next/prev |
| `<leader>k` / `<leader>j` | Location list next/prev |
| `<leader>s` | Search & replace word under cursor |
| `<leader>x` | Make current file executable |
| `<leader><leader>` | Source current file (vim/lua only) |
| `<leader>e` | Inspect diagnostic (float) |
| `<leader>q` | Diagnostics to quickfix list |
| `<C-f>` | Open tmux-sessionizer |
| `<M-h>` | Tmux-sessionizer vsplit |
| `<M-H>` | Tmux-sessionizer new window |

### LSP (when LSP attaches)

| Binding | Action |
|---|---|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>vws` | Workspace symbol |
| `<leader>vd` | Open diagnostic float |
| `<leader>vca` | Code action |
| `<leader>vrr` | References |
| `<leader>vrn` | Rename |
| `<C-h>` (insert) | Signature help |
| `[d` / `]d` | Next/previous diagnostic |

### Telescope

| Binding | Action |
|---|---|
| `<leader>pf` | Find files |
| `<C-p>` | Git files |
| `<leader>pws` | Grep word under cursor |
| `<leader>pWs` | Grep WORD under cursor |
| `<leader>ps` | Grep string (prompt) |
| `<leader>vh` | Help tags |
| `<leader>pg` | Diagnostics |

### Harpoon

| Binding | Action |
|---|---|
| `<leader>a` | Add file to harpoon |
| `<C-e>` | Toggle harpoon quick menu |
| `<M-1>` .. `<M-4>` | Harpoon select 1–4 |

### Fugitive

| Binding | Action |
|---|---|
| `<leader>gs` | Git status |
| `gu` | Diffget //2 (ours) |
| `gh` | Diffget //3 (theirs) |
| `<leader>p` (fugitive) | Git push |
| `<leader>P` (fugitive) | Git pull --rebase |
| `<leader>t` (fugitive) | Git push -u origin |

### Diffview

| Binding | Action |
|---|---|
| `<leader>gd` | Open diff (HEAD) |
| `<leader>gD` | Diff against branch/commit |
| `<leader>gh` | File history |
| `<leader>gH` | Repo history |
| `<leader>gq` | Close diffview |

### Undotree

| Binding | Action |
|---|---|
| `<leader>u` | Toggle undotree |

### nvim-cmp (completion)

| Binding | Action |
|---|---|
| `<C-p>` / `<C-n>` | Select prev/next item |
| `<C-y>` | Confirm selection |
| `<C-Space>` | Complete |

## Notes

- `lazy-lock.json` is ignored in `.gitignore` as it's machine-specific
- OS-specific files (`.DS_Store`, etc.) are also ignored
- Yank in copy mode pipes to system clipboard via `pbcopy` (macOS)
