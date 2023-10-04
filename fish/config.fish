# aliases
abbr -a l eza
abbr -a ls eza
abbr -a ll 'eza -l'
abbr -a lt 'eza -T'
abbr -a pi 'sudo xbps-install'
abbr -a pr 'sudo xbps-remove'

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
        if test -z "$XDG_RUNTIME_DIR"
            set -x XDG_RUNTIME_DIR "/tmp/user-$(id -u)"
            if not test -d "$XDG_RUNTIME_DIR"
                mkdir -p "$XDG_RUNTIME_DIR"
                chmod 0700 "$XDG_RUNTIME_DIR"
            end
        end
        river &>/dev/null
    end
end

