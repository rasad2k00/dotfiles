# Pure prompt 
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt_newline='%666v'
PROMPT=" $PROMPT"
print() {
  [ 0 -eq $# -a "prompt_pure_precmd" = "${funcstack[-1]}" ] || builtin print "$@";
}
prompt pure

# Case-insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ZSH plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable history functionality
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom aliases
alias ls="ls --color=auto"
alias gri="git rebase -i"
alias glp="git log --pretty=fuller"
alias gcf="git commit --fixup"
alias grd="git rebase --committer-date-is-author-date"
alias gs="git status"
alias gd="git diff"
alias gc="git commit"

export EDITOR=nvim

# Custom path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.cargo/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
