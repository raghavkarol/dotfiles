#
# ZSH Customization file
#

HOMEBREW=/opt/homebrew

## PATH

export PATH="${HOMEBREW}/bin:$PATH"
export PATH="${HOMEBREW}/opt/coreutils/libexec/gnubin:$PATH"
export PATH="${HOMEBREW}/opt/findutils/libexec/gnubin:$PATH"
export PATH="${HOMEBREW}/opt/grep/libexec/gnubin:$PATH"
export PATH="/Users/raghav.karol/erlang/21.3.8.21/bin/:$PATH"
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/Users/raghav.karol/.cask/bin:$PATH" # Emacs package manager for MELPA
export PATH="/Applications/Emacs.app/Contents/MacOS/bin/:$PATH"
# ## Go is added to the path like this /etc/paths.d/go
# export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/github/alertlogic/ae_tools/bin:$PATH"

## MANPATH

# export MANPATH="${HOMEBREW}/opt/coreutils/libexec/gnuman:$MANPATH"
# export MANPATH="${HOMEBREW}/share/man"

## ZSH Customizations

### Path to your oh-my-zsh installation
export ZSH=/Users/$USER/.oh-my-zsh

## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
fpath+=${ZSH_CUSTOM}/plugins/zsh-completions/src

Plugins=(git osx docker tmuxinator zsh-completions)
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## Alias

alias emacs="emacsclient -a ''"
alias vi="emacsclient -a ''"
alias vim="emacsclient -a ''"
alias emacst='/Applications/Emacs.app/Contents/MacOS/Emacs -nw -q --load ~/.emacs.d/elisp/terminal_mode.el'
alias ls='ls --color=auto'
alias .='source'

alias lwa='./lwa'
alias m='with_memo'
alias mm='with_memo -M'
eval "$(hub alias -s)"

## Environment

### EDITOR for git
export EDITOR='emacsclient -q'
export vi='emacsclient -q'

# ## For PYTHON's ValueError: unknown locale: UTF-8 errors
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

## AL AWS envrionment
export ENVIRON=global-integration
export AWS_REGION=us-west-2
export AWS_PROFILE=global-integration

# Alertlogic LWA framework
export github_user=raghav-karol
export LWA_UPDATE_CHECK=0

## Go
GOPATH=~/go
export GOPATH
