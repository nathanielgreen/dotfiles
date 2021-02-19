# Dotfiles

This is where my dotfiles are stored.

# Pre-requisties

- Terminal: [kitty](https://sw.kovidgoyal.net/kitty/)
- Shell: [zsh](https://www.zsh.org/)
  - [zsh-z](https://github.com/agkozak/zsh-z)
  - [oh-my-zsh](https://ohmyz.sh/)
    - Prompt Theme: [bullet-train.zsh](https://github.com/caiogondim/bullet-train.zsh)
- Terminal Colors/Theme: [base16-shell](https://github.com/chriskempson/base16-shell)
- Runtime Manager: [asdf](https://asdf-vm.com/)
  - [asdf-node](https://github.com/asdf-vm/asdf-nodejs)
  - [asdf-go](https://github.com/kennyp/asdf-golang)
  - [asdf-python](https://github.com/danhper/asdf-python)
- Editor: [neovim](https://github.com/neovim/neovim)
  - Plugin Manager: [vim-plug](https://github.com/junegunn/vim-plug)
- [tmux](https://github.com/tmux/tmux)
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
```
