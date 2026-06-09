function fish_greeting
    # don't show greeting
end

# configs for interactive session
if status is-interactive
    # aliases
    abbr -a l 'eza --icons=always'
    abbr -a ll 'eza -l'
    abbr -a pi 'paru -S'
    abbr -a pr 'paru -Rns'

    # ctrl+y to accept suggest autocomplete
    bind ctrl-y accept-autosuggestion

    # Start GUI at login
    if status --is-login
        if test (tty) = /dev/tty1
            niri &>/dev/null
        end
    end
end
