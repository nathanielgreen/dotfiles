# Dotfiles

This is where my dotfiles are stored.

# System

- Model: 14" 2021 Macbook Pro
- OS: MacOS Monterey
- WM: Rectangle
- CPU: M1 Max with 10-core  
- GPU: M1 Max 24-core, 16-core Neural Engine
- RAM: 32GB

# Pre-requisties

- Font: [FiraCode](https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager)
- Terminal: [alacritty](https://alacritty.org/)
- Shell: 
  - Login: [zsh](https://www.zsh.org/)
  - Interactive Shell [fish](https://fishshell.com/)
- Terminal Colors/Theme: [TokyoNight](https://github.com/folke/tokyonight.nvim)
- Utilities:
  - Quick Navigation: [zoxide](https://github.com/ajeetdsouza/zoxide)
  - File searcher: [ripgrep](https://github.com/BurntSushi/ripgrep)
  - Fuzzy finder: [fzf](https://github.com/junegunn/fzf)
- Runtime Manager: [asdf](https://asdf-vm.com/)
  - [asdf-node](https://github.com/asdf-vm/asdf-nodejs)
  - [asdf-go](https://github.com/kennyp/asdf-golang)
  - [asdf-python](https://github.com/danhper/asdf-python)
- Editor: [neovim](https://github.com/neovim/neovim)
  - Plugin Manager: [paq](https://github.com/savq/paq-nvim)
- Terminal Multiplexer: [zellij](https://zellij.dev/)

# Installation

Once all the above programs are installed run the following commands:

<details>
  <summary>MacOS</summary>
  ```bash
  # Clone the repo using SSH
  git clone git@github.com:nathanielgreen/dotfiles.git ~/.dotfiles

  # Set up symlinks
  sudo ln -s ~/.dotfiles/mac/neovim/init.lua ~/.config/nvim/init.lua
  sudo ln -s ~/.dotfiles/mac/neovim/lua ~/.config/nvim/lua
  sudo ln -s ~/.dotfiles/mac/fish/config.fish ~/.config/fish/config.fish
  sudo ln -s ~/.dotfiles/mac/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  ```
</details>
