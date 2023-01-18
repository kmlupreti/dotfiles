# aliases
abbr -a l 'exa'
abbr -a ls 'exa'
abbr -a ll 'exa -l'
abbr -a lt 'exa -T'
abbr -a pi 'paru -S'
abbr -a pr 'paru -R'

# append to PATH
set PATH $PATH ~/.cargo/bin

# initial greeting
function fish_greeting
	# neofetch
end

# Start X at login
if status --is-login
  if test (tty) = "/dev/tty1"
    startx
  end
end
