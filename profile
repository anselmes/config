# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
  eval $(/usr/libexec/path_helper -s)
fi

if [ "${BASH-no}" != "no" ]; then
  [ -r /etc/bashrc ] && . /etc/bashrc
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# Path
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

# Func to gen PS1 after CMDs
function __prompt_command() {
  local EXIT="$?"             # This needs to be first
  MYPS1="\[\e[32;1m\](<textcolor>Last:$EXIT\[\e[32;1m\])-\[\e[32;1m\](<textcolor>jobs:\j\[\e[32;1m\])-(<textcolor>\w\[\e[32;1m\])\n\[\e[32;1m\](<textcolor>\$\[\e[32;1m\]) \[\e[0m\]"

  if [ $(id -u) -eq 0 ];
    then # you are root, set red text colour
    textcolor="\[\e[1;31m\]"
  else # yellow
    textcolor="\[\e[1;33m\]"
  fi
  #PS1=${MYPS1//<textcolor>/$textcolor}
  PS1="\[\e]2;$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]${BOLD}\$(usernamehost)\[$GREEN\]\w\$(gitinfo)\[$WHITE\]\n\$ \[$RESET\]"
}

# Change prompt for all users
export PROMPT_COMMAND=__prompt_command
