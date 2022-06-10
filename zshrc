# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/leoli/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable color support of ls and also add handy aliases
# End of lines added by compinstall# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias for python3
alias py='python3'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias for ZeroTier command line interface
alias zerotier='sudo zerotier-cli'

# Alias for android screen copy
alias screencopy='scrcpy -m 1920'

# Function to quick launch my discord bot
launchbot() {
	cd ~/Projects/fluffy-octo-tribble && node index.js
	return 0
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by pipx (https://github.com/pipxproject/pipx)
export PATH="/home/leoli/.local/bin:$PATH"

# Discord Bot token environment variable
export BOT_TOKEN="MjkxNzc5NTI4NzE4ODExMTQ2.WMoK3A.xvyeexWJYxFTMuRM4o0le0ijKN4"

# Set the default editor to nvim
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR=nvim

# Define a convenient cpp run function
cpprun() {
    if [[ $1 =~ '^(.*).cpp$' ]]; then
        g++ -o $match[1] $1 && ./$match[1]
        return 0
    fi
    echo "Not a .cpp file"
    return 1
}

# Define function to begin a bittorrent download from given magnet
tranny() {
    transmission-cli --download-dir /media/hdd/uTorrentDownloads --encryption-preferred --downlimit 5000 $1
    return 0
}

# Have current working directory after username with colors
autoload -U colors && colors
export PS1="[%B%{$fg[green]%}--%T--%{$fg[blue]%}%n@%m%{$reset_color%}%{$fg[yellow]%}%~%{$reset_color%}]%b$"

# Source zsh syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source zsh auto suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Android adb
if [ -d "$HOME/Apps/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/Apps/adb-fastboot/platform-tools:$PATH"
fi

