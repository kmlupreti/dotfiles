# initial greeting message
function fish_greeting
    # don't show anyting for now
end

# configs for interactive session
if status is-interactive
    # Start GUI at login
    if status --is-login
        if test (tty) = /dev/tty1
            niri &>/dev/null
        end
    end

    # aliases
    abbr -a l eza
    abbr -a ll 'eza -l'
    abbr -a la 'eza -la'
    abbr -a lt 'eza -T'
    abbr -a pi 'paru -S'
    abbr -a pr 'paru -Rns'

    # ctrl+y to accept suggest autocomplete
    bind ctrl-y accept-autosuggestion

    # yazi setup
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # zellij setup
    eval (zellij setup --generate-auto-start fish | string collect)
end
