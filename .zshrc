# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Daptiv Configuration
export VAGRANT_SERVER_URL=http://vagrantboxes.hq.daptiv.com
export BOXEN_GITHUB_LOGIN=akaylyn

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rmjs="find ~/src/PpmSpa/src/ -name '*.js' -exec rm {} \;"
alias flushdns='dscacheutil -flushcache;sudo killall -HUP mDNSResponder'

#alias startvm="vmrun -T fusion start \"/Users/apollitt/src/dev_ppm/.vagrant/machines/default/vmware_fusion/e5ca84b1-845e-4569-9338-ca24bd96a04c/packer-vmware-vmx-1411665448.vmx\" nogui"

VM_PATH=$(cat ~/src/dev_ppm/.vagrant/machines/default/vmware_fusion/id)
alias startvm="vmrun -T fusion start \"$VM_PATH\" nogui"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

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
plugins=(git github npm brew brew-cask osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/apollitt/bin:bin:/opt/boxen/rbenv/shims:/opt/boxen/rbenv/bin:/opt/boxen/rbenv/plugins/ruby-build/bin:/opt/boxen/phantomenv/shims:/opt/boxen/phantomenv/bin:node_modules/.bin:/opt/boxen/nodenv/shims:/opt/boxen/nodenv/bin:/opt/boxen/bin:/opt/boxen/homebrew/bin:/opt/boxen/homebrew/sbin:/Users/apollitt/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Users/apollitt/.rvm/bin"
export DEFAULT_USER=apollitt
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

# adjust the soft limit for number of files open
ulimit -n 2048

# Boxen
source /opt/boxen/env.sh

# for PpmEndpointTests
export DB_SERVER_NAME=WIN-2008R2SP1

# for https://github.com/aspnet/home#os-x
source dnvm.sh
export MONO_MANAGED_WATCHER=disabled


