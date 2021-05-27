# Dotfiles

This is where my dotfiles are stored.

# System

### Desktop

- OS: Arch Linux
- WM: i3
- CPU: Intel i5-4690K
- GPU: NVIDIA GeForce GTX 780 Ti
- RAM: 32GB

### Laptop

- Model: Thinkpad X260
- OS: Arch Linux
- WM: i3

# Pre-requisties

- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: [zsh](https://www.zsh.org/)
  - [zsh-z](https://github.com/agkozak/zsh-z)
  - [oh-my-zsh](https://ohmyz.sh/)
    - Prompt Theme: [bullet-train.zsh](https://github.com/caiogondim/bullet-train.zsh)
- Terminal Colors/Theme: [base16 (outrun-dark)](http://www.chriskempson.com/projects/base16/)
- Utilities:
  - Code searcher: [ag](https://github.com/ggreer/the_silver_searcher)
  - Fuzzy finder: [fzf](https://github.com/junegunn/fzf)
- Runtime Manager: [asdf](https://asdf-vm.com/)
  - [asdf-node](https://github.com/asdf-vm/asdf-nodejs)
  - [asdf-go](https://github.com/kennyp/asdf-golang)
  - [asdf-python](https://github.com/danhper/asdf-python)
- Editor: [neovim](https://github.com/neovim/neovim)
  - Plugin Manager: [vim-plug](https://github.com/junegunn/vim-plug)
- Terminal Multiplexer: [tmux](https://github.com/tmux/tmux)
  - Plugin Manager: [tpm](https://github.com/tmux-plugins/tpm)

# Installation

Once all the above programs are installed run the following commands:

```bash
# Clone the repo using SSH
git clone git@github.com:nathanielgreen/dotfiles.git ~/.dotfiles

# Set up symlinks
sudo ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
sudo ln -s ~/.dotfiles/.vimrc ~/.vimrc
sudo ln -s ~/.dotfiles/.zshrc ~/.zshrc
sudo ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf

# Desktop
sudo ln -s ~/.dotfiles/desktop/.screenlayout ~/.screenlayout
sudo ln -s ~/.dotfiles/desktop/.xinitrc ~/.xinitrc
sudo ln -s ~/.dotfiles/desktop/i3config ~/.config/i3/config
```

# Post Install

### Vim

In vim run: `:CocInstall coc-tsserver coc-snippets coc-prettier`
