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

# Function for fzf navigation
fzf_nav() {
  local file

  file=$(fzf --preview '[[ -d {} ]] && ls -la {} || bat --style=numbers --color=always --line-range :100 {}' \
             --bind "ctrl-o:execute-silent(
               if [[ -d {} ]]; then
                 cd {}
               elif [[ {} == *'.config/'* ]]; then
                 cd \"\$(dirname {})\"
               fi
             )+abort" \
             --bind "ctrl-f:execute(
               if [[ -f {} && {} == *'.config/'* ]]; then
                 ${EDITOR:-nvim} {}
               fi
             )")

  # fallback: open selected file if no keybinding used
  if [[ -n "$file" && -f "$file" ]]; then
    ${EDITOR:-nvim} "$file"
  fi
}

