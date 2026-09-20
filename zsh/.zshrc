# ============================================================
# PATH
# ============================================================

export PATH="/opt/homebrew/bin:$PATH"
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$PATH:$HOME/.local/bin" ;;
esac

# ============================================================
# Starship
# ============================================================

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# ============================================================
# Zoxide
# ============================================================

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# ============================================================
# FZF (interactive shells only — needs zle)
# ============================================================

if [[ $- == *i* ]] && command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# ============================================================
# Aliases
# ============================================================

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'

alias cat='bat'
alias grep='rg'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Clear screen + scrollback — Terminal.app + VSCode only (Ghostty left untouched)
if [[ "$TERM_PROGRAM" == "Apple_Terminal" || "$TERM_PROGRAM" == "vscode" ]]; then
  clear() {
    command clear "$@"
    printf '\e[3J'
  }
fi

# ============================================================
# Zsh options
# ============================================================

setopt AUTO_CD
setopt CORRECT
setopt INTERACTIVE_COMMENTS
