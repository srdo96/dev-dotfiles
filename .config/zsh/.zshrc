 export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# go path
 export PATH=$PATH:$HOME/go/bin

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Rust (cargo)
export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR=nvim
export VISUAL=nvim

# Path to your Oh My Zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Load fzf settings
source "$ZDOTDIR/fzf.zsh"

# Load Aliase
source "$ZDOTDIR/aliases.zsh"

