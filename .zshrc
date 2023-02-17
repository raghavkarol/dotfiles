#
# ZSH Customization file
#

# PATH

##
## NOTE:
## DO NOT Do a kerl activate in .zshrc as it does a
##  brew --prefix openssl
## which is slow

## GNU Utils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

## Erlang
export PATH="/Users/rkarol-admin/erlang/21.3.8.21/bin/:$PATH"

## SQLite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

## JAVA
export PATH="/usr/local/opt/openjdk/bin:$PATH"

## Emacs package manager for MELPA
export PATH="/Users/rkarol-admin/.cask/bin:$PATH"

## go is added to the path like this /etc/paths.d/go
export PATH="$GOPATH/bin:$PATH"

## my scripts should be the first in the PATH
export PATH="$HOME/bin:$PATH"
## Use source installation for ae-tools
export PATH=$HOME/github/alertlogic/ae_tools/bin:$PATH

# MANPATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/man:$MANPATH"

# ZSH Customizations

## Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
plugins=(git osx docker tmuxinator zsh-completions)
source $ZSH/oh-my-zsh.sh

## ZSH auto-completions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ALIAS
alias emacs="emacsclient -a ''"
alias vi="emacsclient -a ''"
alias vim="emacsclient -a ''"

alias emacst='/usr/local/bin/emacs -q --load ~/.emacs.d/elisp/terminal_mode.el'
alias ls='ls --color=auto'
alias .='source'
alias lwa='./lwa'
alias m='with_memo'
alias mm='with_memo -M'
# alias ae='./aesolo'
eval "$(hub alias -s)"

# Environment

## EDITOR for git
export EDITOR='emacsclient -q'
export vi='emacsclient -q'

## For PYTHON's ValueError: unknown locale: UTF-8 errors
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

## Go
GOPATH=~/go
export GOPATH

## AL AWS envrionment
export ENVIRON=global-integration
export AWS_REGION=us-west-2
export AWS_PROFILE=global-integration # AWS PROFILE see ~/.aws/credentials
export github_user=raghav-karol       # For LWA makefiles
export LWA_UPDATE_CHECK=0

# Source in secrets
source ~/.zshrc.secrets
