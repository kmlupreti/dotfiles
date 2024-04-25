# aliases
abbr -a l eza
abbr -a ls eza
abbr -a ll 'eza -l'
abbr -a lt 'eza -T'
abbr -a pi 'sudo xbps-install'
abbr -a pr 'sudo xbps-remove'
abbr -a .. 'cd ..'

# starship prompt
starship init fish | source

# initial greeting
function fish_greeting
    neofetch
end

# Start GUI at login
if status --is-login
    if test (tty) = /dev/tty1
        river &>/dev/null
    end
end
