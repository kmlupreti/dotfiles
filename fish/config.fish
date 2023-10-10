# aliases
abbr -a l eza
abbr -a ls eza
abbr -a ll 'eza -l'
abbr -a lt 'eza -T'
abbr -a pi 'paru -Sy'
abbr -a pr 'paru -Rcns'
# append to PATH
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/.local/bin

# initial greeting
function fish_greeting
    # no greeting
end

# Start GUI at login
if status --is-login
    if test (tty) = /dev/tty1
        river &>/dev/null
    end
end
