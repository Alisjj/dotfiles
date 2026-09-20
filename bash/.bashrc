
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/.local/opt/go/bin

. "$HOME/.local/bin/env" 2>/dev/null || true

[[ "$TERM_PROGRAM" == "kiro" ]] && command -v kiro &> /dev/null && . "$(kiro --locate-shell-integration-path bash)"

# ============================================================
# Omarchy prompt port (macOS / Homebrew bash 5)
# Source: basecamp/omarchy default/bash/{envs,shell,init} + config/starship.toml
# Scope: prompt + eza/bat/rg/nvim/git aliases (parity with ~/.zshrc,
# needed because Ghostty runs `bash -l`)
# ============================================================

# --- PATH: Homebrew first, ~/.local/bin like Omarchy ---
case ":$PATH:" in
  *":/opt/homebrew/bin:"*) ;;
  *) export PATH="/opt/homebrew/bin:$PATH" ;;
esac
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$PATH:$HOME/.local/bin" ;;
esac

# --- Editor / pager envs (Omarchy default/bash/envs, macOS-adapted) ---
# Omarchy uses omarchy-launch-editor/omarchy-launch-browser (Linux-only),
# so fall back to nvim/vim here. Respect existing $EDITOR if already set.
export EDITOR="${EDITOR:-nvim}"
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi
export MANROFFOPT="-c"
if command -v bat &> /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# --- History + completion (Omarchy default/bash/shell, macOS paths) ---
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

# Homebrew bash-completion@2 replaces /usr/share/bash-completion/bash_completion
if [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
  source "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

# Ensure command hashing is off for mise (Omarchy parity)
set +h

# --- Tool inits (Omarchy default/bash/init, macOS paths) ---
if command -v mise &> /dev/null; then
  eval "$(mise activate bash)"
fi

if [[ $- == *i* ]] && [[ ${TERM:-} != "dumb" ]] && command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

if command -v fzf &> /dev/null; then
  if [[ -f "/opt/homebrew/opt/fzf/shell/completion.bash" ]]; then
    source "/opt/homebrew/opt/fzf/shell/completion.bash"
  fi
  if [[ -f "/opt/homebrew/opt/fzf/shell/key-bindings.bash" ]]; then
    source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
  fi
fi

# Omarchy readline bindings (~/.inputrc is auto-loaded; explicit bind for parity)
if [[ $- == *i* ]] && [[ -f "$HOME/.inputrc" ]]; then
  bind -f "$HOME/.inputrc" 2> /dev/null || true
fi

# ============================================================
# Aliases (parity with ~/.zshrc — eza/bat/rg/nvim/git)
# Ghostty runs `bash -l`, so without this ll/ls/cat have no icons.
# ============================================================

if command -v eza &> /dev/null; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza --tree --level=2 --icons'
fi

if command -v bat &> /dev/null; then
  alias cat='bat'
fi

if command -v rg &> /dev/null; then
  alias grep='rg'
fi

if command -v nvim &> /dev/null; then
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
fi

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
