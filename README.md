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

- Model: 14" 2021 Macbook Pro
- OS: MacOS Monterey
- WM: Rectangle
- CPU: M1 Max with 10-core  
- GPU: M1 Max 24-core, 16-core Neural Engine
- RAM: 32GB

# Pre-requisties

- Font: [FiraCode](https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager)
- Terminal:
  - Linux: [kitty](https://sw.kovidgoyal.net/kitty/)
  - Mac: [iTerm2](https://iterm2.com/)
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
  - Plugin Manager: [vim-plug](https://github.com/junegunn/vim-plug)
- Terminal Multiplexer: [zellij](https://zellij.dev/)

# Installation

Once all the above programs are installed run the following commands:

<details>
  <summary>Fedora 35</summary>
  ```bash
  # Clone the repo using SSH
  git clone git@github.com:nathanielgreen/dotfiles.git ~/.dotfiles

  # Set up symlinks
  sudo ln -s ~/.dotfiles/.vimrc ~/.vimrc
  sudo ln -s ~/.dotfiles/.bashrc ~/.bashrc

  # Desktop Specific
  sudo ln -s ~/.dotfiles/desktop/config.fish ~/.config/fish/config.fish
  sudo ln -s ~/.dotfiles/desktop/i3config ~/.config/i3/config
  sudo ln -s ~/.dotfiles/desktop/kitty.conf ~/.config/kitty/kitty.conf
  ```
</details>

<details>
  <summary>MacOS</summary>
  ```bash
  # Clone the repo using SSH
  git clone git@github.com:nathanielgreen/dotfiles.git ~/.dotfiles

  # Set up symlinks
  sudo ln -s ~/.dotfiles/mac/init.lua ~/.config/nvim/init.lua
  sudo ln -s ~/.dotfiles/mac/lua ~/.config/nvim/lua
  sudo ln -s ~/.dotfiles/mac/config.fish ~/.config/fish/config.fish
  ```
</details>


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

In vim run: `:TSInstall javascript tsx json dart html typescript svelte`
