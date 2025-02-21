# set environment variables
set -x VISUAL helix
set -x EDITOR helix

set -x QT_QPA_PLATFORM "wayland;xcb"
set -x QT_QPA_PLATFORMTHEME qt6ct

# initial greeting message
function fish_greeting
    # don't show anyting for now
end

# aliases
abbr -a l eza
abbr -a ll 'eza -l'
abbr -a la 'eza -la'
abbr -a lt 'eza -T'
abbr -a pi 'paru -S'
abbr -a pr 'paru -Rns'

# ctrl+y to accept suggest autocomplete
# bind ctrl-y accept-autosuggestion
bind \cy accept-autosuggestion

# configs for interactive session
if status is-interactive
    # Start GUI at login
    if status --is-login
        if test (tty) = /dev/tty1
            start-cosmic &>/dev/null
        end
    end

    #setup zellij    
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = true
            zellij attach -c
        else
            zellij
        end

        if test "$ZELLIJ_AUTO_EXIT" = true
            kill $fish_pid
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
