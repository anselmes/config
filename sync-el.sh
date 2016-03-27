#!/usr/bin/env bash
cd "$(dirname "$0")"
git pull
doIt() {
	rsync --exclude ".git/" --exclude "bin/" --exclude "profile.d/" --exclude "z/" --exclude ".DS_Store" --exclude ".bashrc" --exclude "profile" --exclude "profile-el" --exclude "spf13-vim.sh" --exclude "brew.sh" --exclude "brew-add.sh" --exclude "osx.sh" --exclude "install-deps.sh" --exclude "install-deps-el.sh" --exclude "sync.sh" --exclude "README.md" --exclude "LICENSE.txt" -av . ~
  mv ~/.bashrc-el ~/.bashrc
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source /etc/profile
bash /usr/local/code/spf13-vim.sh
cp -rf /usr/local/code/.vimrc.local ~/
vim +BundleClean +qall -y
rm -f ~/spf13-vim.sh
