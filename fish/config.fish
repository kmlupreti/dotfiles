# aliases
abbr -a l eza
abbr -a ls eza
abbr -a ll 'eza -l'
abbr -a lt 'eza -T'
abbr -a pi 'paru -S'
abbr -a pr 'paru -R'
abbr -a .. 'cd ..'

# starship prompt
starship init fish | source

# disable initial greeting
set fish_greeting

# Start GUI at login
if status --is-login
    if test (tty) = /dev/tty1
        Hyprland &>/dev/null
    end
end
