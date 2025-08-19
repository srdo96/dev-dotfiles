#
# fzf-file-nvim() {
#     local file
#     # Search in .config and all non-hidden directories, plus dotfiles in root
#     file=$({
#         find ./.config -type f 2>/dev/null
#         find . -maxdepth 1 -name ".*" -type f 2>/dev/null
#         find . -type f -not -path "./.*" 2>/dev/null
#     } | grep -v -E "\.(local|cache)" | \
#     fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' --border)
#
#     if [[ -n "$file" ]]; then
#         nvim "$file"
#     fi
# }
#
# # Create a zle widget
# zle -N fzf-file-nvim
# bindkey '^P' fzf-file-nvim


# Function to search files from HOME directory
fzf-file-nvim-home() {
    local file
    # Search from HOME directory
    file=$({
        find ~/.config -type f -not -path "*/node_modules/*" 2>/dev/null
        find ~ -maxdepth 1 -name ".*" -type f 2>/dev/null
        find ~ -type f -not -path "~/.*" -not -path "~/.config/*" -not -path "*/node_modules/*" 2>/dev/null
    } | grep -v -E "\.(local|cache)" | sort -u | \
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' --border --prompt "Home > ")
    if [[ -n "$file" ]]; then
        nvim "$file"
    fi
}

# Function to search files from current directory
fzf-file-nvim-current() {
    local file
    # Search from current directory
    file=$({
        find ./.config -type f -not -path "*/node_modules/*" 2>/dev/null
        find . -maxdepth 1 -name ".*" -type f 2>/dev/null
        find . -type f -not -path "./.*" -not -path "./.config/*" -not -path "*/node_modules/*" 2>/dev/null
    } | grep -v -E "\.(local|cache)" | sort -u | \
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}' --border --prompt "Current > ")
    if [[ -n "$file" ]]; then
        nvim "$file"
    fi
}

# Create zle widgets
zle -N fzf-file-nvim-home
zle -N fzf-file-nvim-current

# Bind keys
bindkey '^P' fzf-file-nvim-home        # Ctrl+P for home directory
bindkey '^x' fzf-file-nvim-current     # Ctrl+O for current directory (alternative)

# Alternative bindings for Ctrl+Shift+P (uncomment one that works):
# bindkey '^[[1;6P' fzf-file-nvim-current  # Try this first
# bindkey '^[[80;6u' fzf-file-nvim-current # Original attempt

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

