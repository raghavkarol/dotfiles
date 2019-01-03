# If you come from bash you might have to change your $PATH.
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
export PATH="$HOME/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:$PATH"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx docker zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias emacsc="emacsclient -a ''"
alias emacs='emacs -q --load ~/.emacs.d/elisp/terminal_mode.el'
alias vi='emacs -q --load ~/.emacs.d/elisp/terminal_mode.el'
alias vim='emacs -q --load ~/.emacs.d/elisp/terminal_mode.el'
alias ls='ls --color=auto'

HOMEBREW_GITHUB_API_TOKEN=46a0e8e8cf0176ed3692b231801af910dea7dcf5
export HOMEBREW_GITHUB_API_TOKEN

# For PYTHON's ValueError: unknown locale: UTF-8 errors
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

PYTHONPATH=/Users/$USER/github/issuu_python:$PYTHONPATH
export PYTHONPATH

# Go
GOPATH=~/go
export GOPATH

export PATH="/Users/rkarol-admin/.gem/ruby/2.5.0/bin:$PATH"

# tmuxinator auto-completions need to be sourced putting. It doesn't
# work even when the file is on the fpath
if [[ -f /usr/local/lib/ruby/gems/2.5.0/gems/tmuxinator-0.13.0/ ]]
then
    source "/usr/local/lib/ruby/gems/2.5.0/gems/tmuxinator-0.13.0/completion/tmuxinator.zsh"
fi

# erl_version=21.1
# echo "Activating erlang version ${erl_version}"
# source "/Users/rkarol-admin/erlang/${erl_version}/activate"

# Running inside dsh
if [[ $(uname) == "Linux" ]]
then
    echo "$HOME/.zshrc: setup zsh for running in dsh container"
    prompt='${ret_status} %{$fg[green]%}*DSH*%{$reset_color%} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info) '
    export ENVIRON=raghav-karol
fi

# ZSH auto-completions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(hub alias -s)"
