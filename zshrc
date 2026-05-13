# ghostty-zsh-dotfiles: zsh snippet
# Source this file from your ~/.zshrc.

autoload -Uz compinit
compinit -d ~/.zcompdump

# More forgiving completion matching for paths and tokens.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

BREW_PREFIX="$(brew --prefix 2>/dev/null || true)"
if [[ -n "$BREW_PREFIX" ]]; then
  [[ -f "$BREW_PREFIX/opt/fzf/shell/completion.zsh" ]] && source "$BREW_PREFIX/opt/fzf/shell/completion.zsh"
  [[ -f "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]] && source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
  [[ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [[ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Prefer filesystem completion suggestions over stale history.
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
bindkey '^[[C' autosuggest-accept

# Prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
