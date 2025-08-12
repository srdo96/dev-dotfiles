#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# alias
alias vim='nvim'
alias cat='bat'

# defult editor
export EDITOR=nvim
export VISUAL=nvim

# android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$HOME/.cargo/bin:$PATH"

PS1='[\u@\h \W]\$ '
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
