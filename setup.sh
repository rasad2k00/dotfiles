function install_package {
	if command -v pacman &>/dev/null; then
		sudo pacman -S $1
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
	check_command alacritty
	check_command tmux
}

function install_omz {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --skip-chsh --unattended
}

function install_powerlevel10k {
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

function install_fonts {
	mkdir ~/.fonts/
	curl -sLO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/GeistMono.zip" --output-dir ~/.fonts/
	unzip ~/.fonts/GeistMono.zip -d ~/.fonts/ && rm ~/.fonts/GeistMono.zip
}

function install_picom {
	check_command picom
}

function install_i3 {
	check_command i3-gaps-rounded-git
}

function configure_tmux {
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	cp ./.tmux.conf ~/.tmux.conf
}

function configure_alacritty {
	cp -r ./.config/alacritty/ ~/.config/
}

function configure_zsh {
	install_omz
	install_powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	cp ./.zshrc ~/.zshrc
	cp ./.p10k.zsh ~/.p10k.zsh
}

function configure_picom {
	install_picom
	cp ./.config/picom.conf ~/.config/
}

function configure_i3 {
	install_i3
	cp -r ./.config/i3/ ~/.config/
}

function main {
	install_prerequirements
	install_fonts
	configure_tmux
	configure_alacritty
	configure_zsh
	configure_picom
	configure_i3
}

main
