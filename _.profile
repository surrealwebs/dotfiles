
# MacPorts Installer addition on 2011-08-17_at_07:26:29: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export M2_HOME=/usr/local/apache-maven/apache-maven-3.0.3
export M2=M2_HOME:$PATH
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$JAVA_HOME:$PATH

alias la="ls -la"



export PATH="$PATH:/Applications/DevDesktop/tools"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
