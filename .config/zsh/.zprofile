# Start Hyprland on tty1 login only, with wallpaper

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  swaybg -i "$HOME/pix/wall/1.jpg" -m fill &
  exec hyprland
fi

# Path Setting
export PATH="$HOME/.local/bin:$PATH"
