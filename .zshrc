# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lfxpaul/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="amuse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# Completion:
zstyle ':completion:*' completer _expand_alias _complete _ignored

# Commands
alias make='make -j4'
alias c='clear'
alias open='xdg-open'

# Git
alias clone='git clone'
alias lg='git log'
alias com='git commit -m'
alias st='git status'
alias grc='git rebase --continue'

# LSP
lsp() {
	compdb -p "$1" list > compile_commands.json
}

# Git worktree
# Go in ~/dev/vtk and type gwk BRANCH_NAME
gwk() {
	mkdir ../"$1" &&
	git worktree add ../"$1"/"$1" &&
	cd ../"$1" &&
	mkdir build &&
	cd build &&
	cmake ../"$1" -GNinja && ninja
}

# List already checked out branch + submodule VTK
gitPV() {
	pathPwd=$(pwd);
	cd /home/lfxpaul/dev/pv1/paraview; echo -n "pv1 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
			cd VTK; vtkBranch=" ["$(git branch --show-current)"]"; echo $vtkBranch;
	cd /home/lfxpaul/dev/pv2/paraview; echo -n "pv2 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
			cd VTK; vtkBranch=" ["$(git branch --show-current)"]"; echo $vtkBranch;
	cd /home/lfxpaul/dev/pv3/paraview; echo -n "pv3 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
			cd VTK; vtkBranch=" ["$(git branch --show-current)"]"; echo $vtkBranch;
	cd /home/lfxpaul/dev/pv4/paraview; echo -n "pv4 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
			cd VTK; vtkBranch=" ["$(git branch --show-current)"]"; echo $vtkBranch;
	cd $pathPwd;
}

# List already checked out branch
gitVTK() {
	pathPwd=$(pwd);
	cd /home/lfxpaul/dev/vtk/vtk1/vtk; echo "vtk1 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
	cd /home/lfxpaul/dev/vtk/vtk2/vtk; echo "vtk2 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
	cd /home/lfxpaul/dev/vtk/vtk3/vtk; echo "vtk3 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
	cd /home/lfxpaul/dev/vtk/vtk82/vtk; echo "vtk82 ("$(git describe --tags --abbrev=0)") =>" $(git branch --show-current);
	cd $pathPwd;
}

# Fetch a remote for all vtk dirs
# $1 is the remote to fetch
gfVTK_() {
	pathPwd=$(pwd);
	cd /home/lfxpaul/dev/vtk/vtk1/vtk; echo "vtk1: Fetching $1"; git fetch "$1";
	cd /home/lfxpaul/dev/vtk/vtk2/vtk; echo "vtk2: Fetching $1"; git fetch "$1";
	cd /home/lfxpaul/dev/vtk/vtk3/vtk; echo "vtk3: Fetching $1"; git fetch "$1";
	cd /home/lfxpaul/dev/vtk/vtk82/vtk; echo "vtk82: Fetching $1"; git fetch "$1";
	cd $pathPwd;
}

gfVTK() {
	gfVTK_ gitlab;
	gfVTK_ origin;
}

gfPV_() {
	pathPwd=$(pwd);
	cd /home/lfxpaul/dev/pv1/paraview; git fetch "$1";
	cd /home/lfxpaul/dev/pv2/paraview; git fetch "$1";
	cd /home/lfxpaul/dev/pv3/paraview; git fetch "$1";
	cd /home/lfxpaul/dev/pv4/paraview; git fetch "$1";
	cd $pathPwd;
}

gfPV() {
	gfPV_ gitlab;
	gfPV_ origin;
}

# Config files
alias xinitrc='vim ~/.xinitrc'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshrc="vim ~/.zshrc"
alias i3cfg="vim ~/.config/i3/config"
alias polybarcfg="vim .config/polybar/config"
alias lightdmcfg="vim /etc/lightdm/lightdm.conf"
alias rangercfg='vim ~.config/ranger/rc.conf'
alias giglobal='vim ~/.gitignore_global'
#dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Directories
alias home='cd ~'
alias dwn='cd ~/Downloads'
alias ..='cd ..'


export GREP_OPTIONS=' --color=auto'
export EDITOR=vim

export PATH=~/bin:/home/lfxpaul/.local/bin:$PATH
export TERM=kitty
