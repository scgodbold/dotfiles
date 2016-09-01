#! /bin/bash

# Path Definitions
DOTFILE_HOME="$HOME/.dotfiles/"
BACKUP_DIR="$HOME/.dotfiles_bak"
REPO="https://github.com/scgodbold/dotfiles"
VIRTUAL_ENV=$HOME/.virtualenvs

req_test() {
  # Checks provided program is installed
  # $1: program that should be in the path
  echo "Checking for $1..."
  hash $1 2> /dev/null ||  {
    echo "[Error]: $1 is not installed"
    return 1
  }
  return 0
}

required_reqs() {
  # Tests that needed programs are installed and will list out missing programs that must be
  # On the machine before dot file installation will continue 
  errors=0  # Track the number of failures, this way we can exit cleanly and print out all requirements in 1 go

  req_test "zsh"
  errors=$((errors + $?))
  req_test "git"
  errors=$((errors + $?))
  req_test "flake8"
  errors=$((errors + $?))
  req_test "pylint"
  errors=$((errors + $?))

  if [ $errors -gt 0 ]; then
    echo 'Please install the mentioned packages before continuing'
    exit 1
  fi
}

optional_reqs() {
  echo 'The following are packages are not required (vim does not depend on them), however may be needed by some other dotfile in the repo'
  echo ''
  req_test "virtualenv"
  req_test "tmux"
  req_test "ag"
  req_test "i3"
}

link() {
  # Give a file name, test if there is something there, remove it if so (to a backup folder)
  # and link the dotfile to the location
  # $1: repo file name that link will ultimately point to (i.e. $DOTFILE_HOME/vimrc)
  # $2: the file where the link will be located (i.e. $HOME/.vimrc)
  if [ -e "$HOME/$2" ]; then
    if [ -L "$HOME/$2" ]; then
      echo "[Info] - $HOME/$2 is already symlinked, unlinking old file" 
      rm $HOME/$2
    else
      echo "[Warning] - File $HOME/$2 exists, moving it to backup dir"
      # Create backup directory if its needed
      if [ -d "$BACKUP_DIR" ]; then
        mkdir $BACKUP_DIR
      fi
      mv $HOME/$2 $BACKUP_DIR/
    fi
  fi

  ln -s $DOTFILE_HOME/$1 $HOME/$2
}

main() {
  # Install all dot files

  # First test that requirements are installed
  required_reqs
  optional_reqs

  # Check and make sure that I haven't already installed the dotfiles
  if [ -d "$DOTFILE_HOME" ]; then
    echo '[Warn] - Dotfiles have already been cloned down skipping the cloning process'
  else
    # Clone down the repo
    git clone $REPO $DOTFILE_HOME
  fi  


  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # Create file structure
  mkdir $HOME/repos
  mkdir $HOME/repos/py
  mkdir $HOME/.vim
  mkdir $HOME/.vim/.backup
  mkdir $HOME/.vim/.undo
  mkdir $HOME/.vim/.swap
  mkdir $HOME/.vim/bundle
  mkdir $HOME/.virtualenvs

  # Install Vundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  # Link all the things
  link "vimrc" ".vimrc"
  link "tmux.conf" ".tmux.conf"
  link "zshrc" ".zshrc"
  link "i3status" ".i3status.conf"
  link "Xresources" ".Xresources"
  link "postdeactivate" ".virtualenvs/postdeactivate"
  link "postactivate" ".virtualenvs/postactivate"
  link "postmkvirtualenv" ".virtualenvs/postmkvirtualenv"
  link "flake8" ".config/flake8"
  link "i3config" ".i3/config"
}

required_reqs
