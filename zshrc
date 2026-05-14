# ghostty-zsh-dotfiles: zsh snippet
# Source this file from your ~/.zshrc.

autoload -Uz compinit
compinit -d ~/.zcompdump

# More forgiving completion matching for paths and tokens.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

# Make native completion much stronger when history has no match.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

BREW_PREFIX="$(brew --prefix 2>/dev/null || true)"
if [[ -n "$BREW_PREFIX" ]]; then
  [[ -f "$BREW_PREFIX/opt/fzf/shell/completion.zsh" ]] && source "$BREW_PREFIX/opt/fzf/shell/completion.zsh"
  [[ -f "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]] && source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
  [[ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [[ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Prefer filesystem completion suggestions over stale history.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'
# Right arrow smart behavior:
# - if cursor is inside the current command, move right normally
# - if cursor is at end and a suggestion exists, accept autosuggestion
_right_arrow_smart_accept() {
  if [[ $CURSOR -lt ${#BUFFER} ]]; then
    zle forward-char
  elif [[ -n "$POSTDISPLAY" ]]; then
    zle autosuggest-accept
  fi
}
zle -N _right_arrow_smart_accept
bindkey '^[[C' _right_arrow_smart_accept

# Prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
