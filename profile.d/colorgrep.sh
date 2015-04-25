# color-grep initialization

if [[ -f /usr/libexec/grepconf.sh ]]; then
  /usr/libexec/grepconf.sh -c || return
fi

alias grep='grep --color=auto' 2>/dev/null
alias egrep='egrep --color=auto' 2>/dev/null
alias fgrep='fgrep --color=auto' 2>/dev/null
