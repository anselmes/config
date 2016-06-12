export HOMEBREW_CASK_OPTS="--appdir=/Applications --prefpanedir=/Library/PreferencePanes --qlplugindir=/Library/QuickLook --fontdir=/Library/Fonts --input_methoddir=/Library/Input\ Methods --screen_saverdir=/Library/Screen\ Savers"

action() {
  caskapps=`ls /opt/homebrew-cask/Caskroom`

  for app in ${caskapps}; do
    apptocheck=`brew cask info ${app} | awk /installed/`

    if [[ -n ${apptocheck} ]]; then
      case $1 in
        outdated) echo ${app};;
        update)brew cask uninstall ${app} && brew cask install --force ${app};;
        *) break;;
      esac
    fi
  done
}

alias brew_cask_outdated="action outdated"
alias brew_cask_upgrade="action update"
