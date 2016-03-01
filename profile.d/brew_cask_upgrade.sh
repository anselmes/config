#!/usr/bin/env bash

caskApps=( $(ls /opt/homebrew-cask/Caskroom/) )
caskList=( $(brew cask list) )
diffs=()

for i in "${caskApps[@]}"; do
  skip=
  for j in "${caskList[@]}"; do
    [[ $i == $j ]] && { skip=1; break; }
  done
  [[ -n $skip ]] || diffs+=("$i")
done

if [[ $(echo ${#diffs[@]}) -eq 0 ]]; then
  exit
elif [[ $(echo ${#diffs[@]}) -gt 1 ]]; then
  s="s"
fi

difList=$(printf ", %s" "${diffs[@]}")
difList=${difList:1}

echo -e "==> Upgrading ${#diffs[@]} outdated cask$s, with result:\n$difList\n"

for i in "${diffs[@]}"; do
  brew cask uninstall "$i"
  brew cask install "$i"
done
