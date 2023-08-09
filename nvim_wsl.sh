#!/bin/bash
cd $HOME

# Install dependencies.
echo "Installing dependencies..."
sudo apt update
sudo apt install \
    ninja-build gettext cmake unzip curl \ # For Neovim source build
sudo apt install tmux ripgrep fzf fd-find zsh

mkdir -p coding && cd coding

# Install Neovim
nvim --version
if [ $? -eq 0 ]
then
    echo "Neovim already installed"
else
    echo "Installing Neovim..."
    if [ ! -d "$HOME/coding/neovim" ]
    then
        git clone https://github.com/neovim/neovim
        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
        ;
    fi
fi

# Install NVM
nvm --version
if [ $? -eq 0 ]
then
    echo "NVM already installed"
else
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    if [ -e $HOME/.zshrc ]
    then
        source $HOME/.zshrc
    else
        source $HOME/.bashrc
    fi
    # Install Node.js
    echo "Installing Node.js..."
    nvm install latest
    ;
fi


lazygit --version
if [ $? -eq 0 ]
then
    echo "Lazygit already installed."
else
    echo "Installing lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    ;
fi

pyenv --version
if [ $? -eq 0 ]
then
    echo "Pyenv already installed."
else
    echo "Installing pyenv..."
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    if [ -e $HOME/.zshrc ]
    then
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
        echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
        echo 'eval "$(pyenv init -)"' >> ~/.zshrc
        source $HOME/.zshrc
        ;
    fi
fi

echo "Environment setup complete."
