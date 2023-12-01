function install_package  {
	if command -v pacman &> /dev/null
	then
		sudo pacman -S $1
		return 0
	fi
	if command -v apt &> /dev/null
	then
		sudo apt install $1
		return 0
	fi
	if command -v dnf &> /dev/null
	then
		sudo dnf install $1
		return 0
	fi
	return 1
}

function check_command {
	if ! command -v $1 &> /dev/null
	then
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
}

function install_omz {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --skip-chsh --unattended
}

function install_fonts {
	mkdir ~/.fonts/
	curl -sLO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/GeistMono.zip" --output-dir ~/.fonts/
	unzip ~/.fonts/GeistMono.zip -d ~/.fonts/ && rm ~/.fonts/GeistMono.zip
}

function main {
	install_prerequirements
	install_omz
	install_fonts
}

main
