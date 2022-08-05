# SSH host completion
# ref: https://gist.github.com/aliang/1024466
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh


alias ls='ls -CF'
alias propen="open -a Preview.app"


export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PS1="\[\033[1;34m\][\@] \h\[\033[0m\]:\[\033[1;34m\]\W\[\033[0m\]$ "
export PATH="$PATH:$HOME/bin/"


# date utilities
alias now="date +'%F %H:%M'"
alias today="date +%F"
alias yesterday="date -v-1d +%F"

function lastmon {
    local offset="${1: }"
    val=$(date $offset -v-Mon +%F)
    echo "$val"
}

function lastfri {
    local offset="${1: }"
    val=$(date $offset -v-Mon -v+4d +%F)
    echo "$val"
}

# Bookmarking
# ref: https://www.datascienceworkshops.com/blog/quickly-navigate-your-filesystem-from-the-command-line/
export MARKPATH=$HOME/.marks
function jump { 
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
	mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
	rm -i "$MARKPATH/$1"
}
function marks {
	\ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  # local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  local wordlist=$(find $MARKPATH -type l -exec basename {} \;)
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

complete -F _completemarks jump unmark
