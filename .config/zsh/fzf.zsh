
fzf-file-nvim() {
    local file
    # Search in .config and all non-hidden directories, plus dotfiles in root
    file=$({
        find ./.config -type f 2>/dev/null
        find . -maxdepth 1 -name ".*" -type f 2>/dev/null
        find . -type f -not -path "./.*" 2>/dev/null
    } | grep -v -E "\.(local|cache)" | \
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' --border)

    if [[ -n "$file" ]]; then
        nvim "$file"
    fi
}

# Create a zle widget
zle -N fzf-file-nvim
bindkey '^P' fzf-file-nvim

# Function to navigate folders
fzf-folder-nav() {
    local dir
    # Find directories, excluding hidden ones except .config
    dir=$({
        find ./.config -type d 2>/dev/null
        find . -type d -not -path "./.*" 2>/dev/null
    } | grep -v -E "\.(local|cache)" | \
    fzf --preview 'ls -la {}' --height=80% --border)

    if [[ -n "$dir" ]]; then
        cd "$dir"
        zle reset-prompt
    fi
}

# Create zle widgets
zle -N fzf-folder-nav
bindkey '^O' fzf-folder-nav

