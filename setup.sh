function install_package {
	if command -v yay &>/dev/null; then
		yay -S $1
		return 0
	fi
	if command -v apt &>/dev/null; then
		sudo apt install $1
		return 0
	fi
	if command -v dnf &>/dev/null; then
		sudo dnf install $1
		return 0
	fi
	return 1
}

function check_command {
	if ! command -v $1 &>/dev/null; then
		echo "[-] '$1' not found!"
		echo "[+] Installing '$1'."
		install_package $1
	else
		echo "[+] $1 found!"
	fi
}

function install_prerequirements {
	check_command git
	check_command curl
	check_command zsh
	check_command tmux
	check_command neovim
	check_command go
	check_command cargo
}

function install_fonts {
	curl -sO "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf" --output-dir "~/.local/share/fonts"
	curl -sO "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf" --output-dir "~/.local/share/fonts"
	curl -sO "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf" --output-dir "~/.local/share/fonts"
	curl -sO "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf" --output-dir "~/.local/share/fonts"
}

function install_nvm {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
}

function install_node {
	install_nvm
	nvm install --lts
}

function configure_tmux {
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s ./.tmux.conf ~/.tmux.conf
}

function configure_zsh {
	mkdir -p ~/.zsh
	git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh/zsh-vi-mode
	ln -s ./.zshrc ~/.zshrc
}

function configure_neovim {
	ln -s .config/nvim ~/.config/nvim
}

function main {
	install_prerequirements
	install_fonts
	install_node
	configure_tmux
	configure_zsh
	configure_neovim
}

main
