# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================
# ENVIRONMENT VARIABLES
# ==============================

export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/18/bin
export PATH="$(brew --prefix python@3.14)/libexec/bin:$(brew --prefix python@3.14)/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME/bin:$PATH"

# ==============================
# OH MY ZSH
# ==============================

ZSH_THEME=""

plugins=(
  git
)

source "$ZSH/oh-my-zsh.sh"

# Powerlevel10k installed through homebrew
source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"

# ==============================
# ALIASES
# ==============================

alias fzf="fzf -m"
alias ls="eza -1 --icons always"
alias lsd="eza -lh1 --icons always"
alias lst="eza --icons never -T -L"
alias v="nvim"
alias f="yazi"
alias lg="lazygit"
# To-do tui
alias dod="TEXTUAL_THEME=catppuccin-frappe uv run --project ~/tools/to-do python ~/tools/to-do/textual-tui"
# Theme switchers
alias themecat="zsh ~/tools/theme-switcher/catppuccin/catppuccin.sh && reload-theme && source ~/.zshrc"
alias themebasic="zsh ~/tools/theme-switcher/basic/basic.sh && reload-theme && source ~/.zshrc"
alias themeeverf="zsh ~/tools/theme-switcher/everforest/everforest.sh && reload-theme && source ~/.zshrc"
alias themet="zsh ~/tools/theme-switcher/tamasm/tamasm.sh && reload-theme && source ~/.zshrc"
# Cheat sheets
alias csgit="leaf ~/markdowns/cheat-sheets/git.md"
alias csdocker="leaf ~/markdowns/cheat-sheets/docker.md"
alias cssql="leaf ~/markdowns/cheat-sheets/sql.md"
alias cspy="leaf ~/markdowns/cheat-sheets/python.md"

# ==============================
# FUNCTIONS
# ==============================

# Fuzzy directory navigation
function cdi() {
  local dir
  dir=$(zoxide query -l | fzf) && cd "$dir"
}

# Reload powerlevel10k configuration
reload-theme() {
  source ~/.p10k.zsh
  p10k reload
}

# ==============================
# OTHER
# ==============================

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

# powerlevel10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Maybe needed later for pnpm
# # pnpm
# export PNPM_HOME='/Users/tamasm/Library/pnpm'
# case ":$PATH:" in
#   ":$PNPM_HOME/bin:"*) ;;
#   *) export PATH="$PNPM_HOME/bin:$PATH" ;;
# esac
# # pnpm end
