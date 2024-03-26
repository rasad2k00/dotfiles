# Pure prompt 
fpath+=(~/.zsh/pure)
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

# Custom path
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/.cargo/bin
