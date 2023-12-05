# Dotfiles

This is where my dotfiles are stored.

# System

- Model: 14" 2021 Macbook Pro
- OS: MacOS Ventura
- WM: aerospace
- CPU: M1 Max with 10-core  
- GPU: M1 Max 24-core, 16-core Neural Engine
- RAM: 32GB

# Pre-requisties

- Font: [FiraCode](https://github.com/tonsky/FiraCode/wiki/)
- Terminal: [alacritty](https://alacritty.org/)
- Shell: 
  - [zsh](https://www.zsh.org/)
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
  - Plugin Manager: [lazy](https://www.lazyvim.org/)
- Terminal Multiplexer: [zellij](https://zellij.dev/)

# Installation

Once all the above programs are installed run the following commands:

```bash
# Clone the repo using SSH
git clone git@github.com:nathanielgreen/dotfiles.git ~/.dotfiles

# Set up symlinks
sudo ln -s ~/.dotfiles/neovim/init.lua ~/.config/nvim/init.lua
sudo ln -s ~/.dotfiles/neovim/lua ~/.config/nvim/lua
sudo ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
sudo ln -s ~/.dotfiles/.aerospace.toml ~/.aerospace.toml
sudo ln -s ~/.dotfiles/.zshrc ~/.zshrc
```
