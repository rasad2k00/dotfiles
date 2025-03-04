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
	mkdir -p ~/.local/share/fonts
	curl -sLO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip" --output-dir ~/.local/share/fonts
	unzip ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts && rm ~/.local/share/fonts/JetBrainsMono.zip
}

function install_nvm {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
}

function configure_node {
	install_nvm
	source ~/.zshrc
	nvm install --lts
}

function configure_tmux {
	ln -s $PWD/.tmux.conf ~/.tmux.conf
}

function configure_zsh {
	mkdir -p ~/.zsh
	curl -sS https://starship.rs/install.sh | sh
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	ln -s $PWD/.zshrc ~/.zshrc
}

function configure_alacritty {
	ln -s $PWD/.config/alacritty ~/.config/alacritty
}

function configure_i3 {
	ln -s $PWD/.config/i3 ~/.config/i3
}

function get_release_version {
	curl -s https://api.github.com/repos/$1/releases/latest | grep "browser_download_url" | head -n 1 | cut -d / -f 8
}

function install_bob {
	VERSION=$(get_release_version "mordechaihadad/bob")
	curl -sLO https://github.com/mordechaihadad/bob/releases/download/$VERSION/bob-linux_x86_64.zip --output-dir ~/Downloads
	tar -xvf ~/Downloads/bob-linux_x86_64.zip -C ~/Downloads && mv ~/Downloads/bob-linux-x86_64/bob ~/.local/bin && chmod +x ~/.local/bin/bob && rm -rf ~/Downloads/bob-linux_x86_64*
}

function configure_neovim {
	install_bob
	source ~/.zshrc
	bob install stable
	ln -s $PWD/.config/nvim ~/.config/nvim
}

function install_fzf {
	VERSION=$(get_release_version "junegunn/fzf")
	curl -sLO https://github.com/junegunn/fzf/releases/download/$VERSION/fzf-${VERSION:1}-linux_amd64.tar.gz --output-dir ~/Downloads
	tar -xvf ~/Downloads/fzf-${VERSION:1}-linux_amd64.tar.gz -C ~/.local/bin && rm ~/Downloads/fzf-${VERSION:1}-linux_amd64.tar.gz
}

function main {
	install_prerequirements
	install_fonts
	configure_tmux
	configure_zsh
	configure_node
	configure_neovim
	#configure_alacritty
	#configure_i3
	install_fzf
	chsh
}

main
