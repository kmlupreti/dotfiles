# set environment variables
set -x VISUAL helix
set -x EDITOR helix

# configs for interactiive session
if status is-interactive
    # aliases
    abbr -a l eza
    abbr -a ll 'eza -l'
    abbr -a lt 'eza -T'
    abbr -a pi 'paru -S'
    abbr -a pr 'paru -Rns'
    abbr -a yz yazi
    abbr -a hx helix

    # starship prompt
    starship init fish | source

    # disable initial greeting
    set fish_greeting

    # ctrl+y to accept suggest autocomplete
    bind \cy accept-autosuggestion

    # Start GUI at login
    if status --is-login
        if test (tty) = /dev/tty1
            Hyprland &>/dev/null
        end
    end
end

# yazi file explorer
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
