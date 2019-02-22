XDEBUG_CONFIG=idekey=PHPSTORM
PATH=/Users/YOURUSERNAME/.node/bin:/Users/YOURUSERNAME/bin:/Users/YOURUSERNAME/.composer/vendor/bin:/Users/YOURUSERNAME/.wp-cli/bin:/usr/local/Cellar/emacs/24.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:~/.local/bin:/Applications/Postgres.app/Contents/Versions/latest/bin

# JS/CSS Linting (for WP)
PATH=${PATH}:/usr/local/bin/eslint
PATH=${PATH}:/usr/local/bin/sass-lint

alias SYMFONY_DEBUG='dev'
alias clean='rmmac; find . -name '\''*~'\'' -type f -delete'
alias desktop='cd ~/Desktop'
alias docs='cd ~/Documents'
alias emacs='/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw'
alias fetchall='git fetch --all'
alias gitall='git clone --recursive'
alias gitf='git fetch --all --prune'
alias la='ls -laG'
alias rebash='source ~/.bash_profile'
alias rmds='find . -name '\''*.DS_Store'\'' -type f -delete'
alias rmmac='rmds; find . -name '\''._*'\'' -type f -delete'
alias showbranches='git branch -a'
alias sshSERVERALIAS='ssh YOURUSERNAME@SERVERADDRESS'
alias vclean='vagrant global-status --prune'
alias vdown='vagrant halt'
alias vh='vagrant halt'
alias vhalt='vagrant halt'
alias vhaltall='vagrant global-status | awk '\''/running/{print }'\'' | gxargs -r -d '\''\n'\'' -n 1 -- vagrant halt'
alias vprov='vagrant provision'
alias vshell='vagrant ssh'
alias vstat='vagrant global-status'
alias vup='vagrant up'
alias gitcurr='git branch -a|grep '\''*'\'''
alias dotnet='/usr/local/share/dotnet/dotnet'
alias gitwhat='git log $(git describe --tags --abbrev=0)..HEAD --oneline'
alias gitchangedfiles='git diff --name-only HEAD $(git describe --tags --abbrev=0)'

#alias rrs='rails server'
#alias rrc='rails console'
#alias rrg='rails generate'
#alias rrt='rails test'


# Bash Completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# ########### PROMPT

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="(\d \A) \[\e[33m\]\u\[\e[m\]@\h\[\e[36m\][\[\e[m\]\[\e[36m\]\w\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\]\[\e[36m\]]\[\e[m\]\$> "


# ########### PROMPT





# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


blt () 
{ 
    if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
        GIT_ROOT=$(git rev-parse --show-cdup);
    else
        GIT_ROOT=".";
    fi;
    if [ -f "$GIT_ROOT/vendor/bin/blt" ]; then
        $GIT_ROOT/vendor/bin/blt "$@";
    else
        echo "You must run this command from within a BLT-generated project repository.";
        return 1;
    fi
}

function blt() {
  if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    GIT_ROOT=$(git rev-parse --show-cdup)
  else
    GIT_ROOT="."
  fi

  if [ -f "$GIT_ROOT/vendor/bin/blt" ]; then
    $GIT_ROOT/vendor/bin/blt "$@"
  else
    echo "You must run this command from within a BLT-generated project repository."
    return 1
  fi
}
# eval "$(rbenv init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/YOURUSERNAME/Documents/apps/google-cloud-sdk/path.bash.inc' ]; then . '/Users/YOURUSERNAME/Documents/apps/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/YOURUSERNAME/Documents/apps/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/YOURUSERNAME/Documents/apps/google-cloud-sdk/completion.bash.inc'; fi
