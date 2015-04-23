#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
# cdf() {
#   currFolderPath=$( /usr/bin/osascript << EOT
#   tell application "Finder"
#   try
#   set currFolder to(folder of the front window as alias)
#   on error
#   set currFolder to(path to desktop folder as alias)
#   end try
#   POSIX path of currFolder
#   end tell
#   EOT
#   )
#   echo "cd to \"$currFolderPath\""
#   cd "$currFolderPath"
# }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findpid() { lsof -t -c "$@" ; }

# git log with per-commit cmd-clickable GitHub URLs (iTerm)
# gf() {
#   local remote="$(git remote -v | awk '/^origin.*\(push\)$/ {print $2}')"
#   [[ "$remote" ]] || return
#   local user_repo="$(echo "$remote" | perl -pe 's/.*://;s/\.git$//')"
#   git log $* --name-status --color | awk "$(cat << AWK
#   /^.*commit [0-9a-f]{40}/ {sha=substr(\$2,1,7)}
#   /^[MA]\t/ {printf "%s\thttps://github.com/$user_repo/blob/%s/%s\n", \$1, sha, \$2; next}
#   /.*/ {print \$0}
#   AWK
#   )" | less -F
# }

gitinfo() {
  # check if we're in a git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # quickest check for what branch we're on
  branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

  # check if it's dirty (via github.com/sindresorhus/pure)
  dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

  echo $WHITE" on "$PURPLE$branch$dirty
}

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
httpdebug() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ;myip
  #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
  echo
}

#   mans:   Search manpage given in agument '1' for term given in argument '2'(case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
mans() {
  man $1 | grep -iC2 --color=always $2 | less
}

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
myps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

#   showa: to remind yourself of an alias(given some part of it)
#   ------------------------------------------------------------
showa() { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

# Only show username/host if not default
usernamehost() {
  if [ $USER != "$default_username" ]; then echo "${MAGENTA}$USER ${WHITE}at ${ORANGE}$HOSTNAME $WHITEin "; fi
}

cdl() { builtin cd "$@"; ll; }  # Always list directory contents upon 'cd'
ff() { /usr/bin/find . -name "$@" ; } # ff: Find file under the current directory
ffs() { /usr/bin/find . -name "$@"'*' ; } # ffs: Find file whose name starts with a given string
ffe() { /usr/bin/find . -name '*'"$@" ; } # ffe: Find file whose name ends with a given string
httpheaders() { /usr/bin/curl -I -L $@ ; }  # httpHeaders:  Grabs headers from web page
md() { mkdir -p "$1" && cd "$1"; }  # mcd:  Makes new Dir and jumps inside
trash() { command mv "$@" ~/.Trash ; }  # trash:  Moves a file to the MacOS trash
ql() { qlmanage -p "$*" >& /dev/null; } # ql:  Opens any file in MacOS Quicklook Preview
zipf() { zip -r "$1".zip "$1" ; } # zipf: To create a ZIP archive of a folder
