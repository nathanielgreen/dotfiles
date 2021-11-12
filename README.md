# Dotfiles

This is where my dotfiles are stored.

# System

### Desktop

- OS: Fedora 35
- WM: i3
- CPU: Intel i5-4690K
- GPU: NVIDIA GeForce GTX 780 Ti
- RAM: 32GB

### Laptop

- Model: Thinkpad X260
- OS: Fedora 35
- WM: i3

# Pre-requisties

- Font: [FiraCode](https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager)
- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: [zsh](https://www.zsh.org/)
  - [zoxide](https://github.com/ajeetdsouza/zoxide)
  - [oh-my-zsh](https://ohmyz.sh/)
    - Prompt Theme: robbyrussel
- Terminal Colors/Theme: [TokyoNight](https://github.com/folke/tokyonight.nvim)
- Utilities:
  - File searcher: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - Fuzzy finder: [fzf](https://github.com/junegunn/fzf)
- Runtime Manager: [asdf](https://asdf-vm.com/)
  - [asdf-node](https://github.com/asdf-vm/asdf-nodejs)
  - [asdf-go](https://github.com/kennyp/asdf-golang)
  - [asdf-python](https://github.com/danhper/asdf-python)
- Editor: [neovim](https://github.com/neovim/neovim)
  - Plugin Manager: [vim-plug](https://github.com/junegunn/vim-plug)
- Terminal Multiplexer: [zellij](https://zellij.dev/)

# Installation

Once all the above programs are installed run the following commands:

```bash
# Clone the repo using SSH
git clone git@github.com:nathanielgreen/dotfiles.git ~/.dotfiles

# Set up symlinks
sudo ln -s ~/.dotfiles/.vimrc ~/.vimrc
sudo ln -s ~/.dotfiles/.zshrc ~/.zshrc
sudo ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf

# Desktop
sudo ln -s ~/.dotfiles/desktop/i3config ~/.config/i3/config

# Laptop
sudo ln -s ~/.dotfiles/laptop/i3config ~/.config/i3/config
```

To tell neovim to use ~/.vimrc, add the following to your
`~/.config/nvim/init.vim`:

```bash
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

# Post Install

### Neovim 0.5

**NOTE:** If on Fedora 35 you'll need to install some dependencies before
installing Treesitter packages:

```
sudo dnf install gcc-c++
sudo dnf install libstdc++-static
```

In vim run: `:TSInstall javascript tsx json dart html typescript`
