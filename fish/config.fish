# aliases
abbr -a l eza
abbr -a ls eza
abbr -a ll 'eza -l'
abbr -a lt 'eza -T'
abbr -a pi 'paru -Sy'
abbr -a pr 'paru -Rcns'

# initial greeting
function fish_greeting
    # no greeting
end

# Start GUI at login
if status --is-login
    if test (tty) = /dev/tty1
        niri &>/dev/null
    end
end
