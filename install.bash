# This script installs and configures the following:
#
# - Windows Terminal Preview (wt)
# - gruvbox-material theme
# - UbuntuMonoNerd font
# - Git Bash (bash, git, vim)
# - GitHub CLI (gh)
# - Neovim (nvim)
# - Golang (go)

ismac() {
	return 1
}

[[ -z "$OS" ]] && OS=$(uname)
case "$OS" in
*arwin*) ismac() {
	return 0
} ;;
esac

have() { type "$1" &>/dev/null; }

install-brew() {
	if have brew; then
		echo "Have brew, skipping."
		return
	fi
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

update-mac-bash() {
	if [[ ! $BASH_VERSION =~ ^3 ]]; then
		echo "bash version above three, skipping."
		return
	fi
	echo "$(brew --prefix)/bin/bash" | sudo tee -a /etc/shells
	chsh -s "$(brew --prefix)/bin/bash"
}

config-bash() {
	curl -fsSL "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.bashrc" -o ~/.bashrc
	echo 'bashrc overwritten'
}

install-alacritty() {
	if ismac; then
		brew install alacritty
		return
	fi
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt-get update -y
	sudo apt-get install -y alacritty
}

config-alacritty() {
	if test -e ~/.config/alacritty/alacritty.toml; then
		echo "Alacritty config detected, skipping."
		return
	fi
	mkdir -p ~/.config/alacritty
	curl -fsSL "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.config/alacritty/alacritty.toml" -o ~/.config/alacritty/alacritty.toml
	ismac && perl -p -i -e 's,program = "bash",program = "/opt/homebrew/bin/bash",' ~/.config/alacritty/alacritty.toml
}

install-ubuntu-mono-nerd-font() {
	if test -e ~/.local/share/fonts/UbuntuMonoNerdFont-Regular.ttf; then
		echo "UbuntuMonoNerdFont detected, skipping."
		return
	fi
	curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.zip ~/.local/share/fonts
	mkdir -p ~/.local/share/fonts
	unzip UbuntuMono.zip -d ~/.local/share/fonts
	fc-cache -fv
}

install-neovim() {
	if have nvim; then
		echo "nvim detected, skipping."
		return
	fi
	if ismac; then
		brew install neovim
		return
	fi
	sudo apt-get install -y neovim
}

config-neovim() {
	if have nvim; then
		echo "nvim detected, skipping configuration."
		return
	fi
	curl -fsSL "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.vimrc" -o ~/.vimrc
	mkdir -p ~/.vim/autoload
	mkdir -p ~/.config/nvim
	curl -fsSL "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.vim/autoload/plug.vim" -o ~/.vim/autoload/plug.vim
	curl -fsSL "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.config/nvim/init.lua" -o ~/.config/nvim/init.lua
	vim +PlugInstall +qall
	echo "Installing Go vim binaries. (Should take a while.)"
	vim +GoInstallBinaries +qall
	echo "Go binaries installed."
}

install-go() {
	if have go; then
		echo "go detected, skipping."
		return
	fi
	if ismac; then
		brew install golang
		return
	fi
	sudo apt-get install -y golang
}

install-cm() {
	go install github.com/rwxrob/code-mage/cmd/cm@latest
}

show-welcome() {
	echo "Welcome to your new personal development environment!"
}

ismac && install-brew
ismac && update-mac-bash
config-bash
install-alacritty
config-alacritty
install-ubuntu-mono-nerd-font
install-neovim
config-neovim
install-go
install-cm
show-welcome
