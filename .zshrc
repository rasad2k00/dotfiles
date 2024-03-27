# Pure prompt 
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Case-insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ZSH plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Yank to the system and put from the system clipboard
function zvm_vi_yank {
	zvm_yank
	echo "$CUTBUFFER" | pbcopy
	zvm_exit_visual_mode
}

# Enable history functionality
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Custom aliases
alias ls="ls --color=auto"
alias gri="git rebase -i"
alias glp="git log --pretty=fuller"
alias gcf="git commit --fixup"
alias grd="git rebase --committer-date-is-author-date"

export EDITOR=nvim

# Custom path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.cargo/bin
