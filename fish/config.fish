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

    # auto attach zellij main session
    if not set -q ZELLIJ
        zellij attach main || zellij -s main
    end
end
