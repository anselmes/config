
# color-grep initialization

if [[ -f /usr/libexec/grepconf.sh ]]; then
  /usr/libexec/grepconf.sh -c
  if ( $status == 1 ) then
      exit
  endif
endif

alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'
