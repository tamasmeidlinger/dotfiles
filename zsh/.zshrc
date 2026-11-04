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

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
)

source "$ZSH/oh-my-zsh.sh"

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
alias dod="TEXTUAL_THEME=tamasm uv run --project ~/tools/to-do python ~/tools/to-do/textual-tui"
# Theme switchers
# alias themecat="zsh ~/tools/theme-switcher/catppuccin/catppuccin.sh && reload-theme && source ~/.zshrc"
# alias themebasic="zsh ~/tools/theme-switcher/basic/basic.sh && reload-theme && source ~/.zshrc"
# alias themeeverf="zsh ~/tools/theme-switcher/everforest/everforest.sh && reload-theme && source ~/.zshrc"
# alias themet="zsh ~/tools/theme-switcher/tamasm/tamasm.sh && reload-theme && source ~/.zshrc"
# Cheat sheets
alias csgit="leaf ~/markdowns/cheat-sheets/git.md"
alias csdocker="leaf ~/markdowns/cheat-sheets/docker.md"
alias cssql="leaf ~/markdowns/cheat-sheets/sql.md"
alias cspy="leaf ~/markdowns/cheat-sheets/python.md"
# Fastfetch
alias ff="clear && fastfetch"

# ==============================
# FZF
# ==============================

source <(fzf --zsh)

export FZF_DEFAULT_OPTS="
  --style=minimal
  --layout=reverse
  --border=rounded
  --padding=0
  --info=inline
  --prompt=''
  --pointer='▶'
  --marker='✓'
  --color=bg:#292C35
  --color=fg:#9CCBEF
  --color=hl:#D3CFBB
  --color=fg+:#C6D0F5
  --color=bg+:#313549
  --color=hl+:#D3CFBB
  --color=info:#838BA7
  --color=prompt:#8CAAEE
  --color=pointer:#A5D98F
  --color=marker:#A6D189
  --color=spinner:#8CAAEE
  --color=header:#A5ADCE
  --color=border:#51576D
"

source "$HOMEBREW_PREFIX/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"

# FZF-TAB appearance
zstyle ':fzf-tab:*' fzf-flags \
  --height=60% \
  --layout=reverse \
  --border=rounded \
  --info=inline-right \
  --prompt='❯ ' \
  --pointer='❯' \
  --marker='▌' \
  --color='bg:#292c35,bg+:#292c35,fg:#cdd6f4,fg+:#cdd6f4' \
  --color='hl:#89dceb,hl+:#89dceb,prompt:#89dceb,pointer:#89dceb' \
  --color='marker:#f38ba8,border:#49b6c8,info:#6c7086'

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
