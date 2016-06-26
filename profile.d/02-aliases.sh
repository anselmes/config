#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memhogstop='top -l 1 -o rsize | head -20'
alias memhogsps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpuhogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing(every 10 seconds)
#   -----------------------------------------------------
alias topforever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias findershowhidden='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias finderhidehidden='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
alias cleanupls="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
alias screensaverdesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FlhG'            # Preferred 'ls' implementation
alias la='ls -AlhG'
alias l='ls -CFG'
alias lsd='ls -l | grep "^d"'               # List only directories
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level(for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"
alias c='pygmentize -O style=monokai -f console256 -g'
# alias which='type -all'                     # which:        Find executables
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size(all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size(all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size(all zeros)
alias qfind="find . -name "                 # qfind:    Quickly search for file
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netcons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushdns='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsocku='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockt='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipinfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipinfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openports='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showblocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias mountrw='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user
alias apacheedit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacherestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias edithosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apachelogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
