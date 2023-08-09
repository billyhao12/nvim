cd $HOME

brew --version
if [ $? -eq 0 ]
then
    echo "Homebrew already installed."
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dependencies.
echo "Install dependencies..."
brew install zsh pyenv unzip pip fzf ripgrep fd tmux nvm lazygit

# Install Neovim
nvim --version
if [ $? -eq 0 ]
then
    echo "Neovim already installed"
else
    echo "Installing Neovim..."
    brew install --HEAD neovim
fi

echo "Environment setup complete.
