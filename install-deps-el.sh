#!/usr/bin/env bash
# up to you (me) if you want to run this as a file or copy paste at your leisure

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
curl https://raw.github.com/jamiew/git-friendly/master/install.sh | bash

# https://github.com/rupa/z
# z, oh how i love you
cd /usr/local/code
git clone https://github.com/rupa/z.git
chmod +x /usr/local/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)
# z binary is already referenced from .bash_profile

# for the c alias (syntax highlighted cat)
pip install -U Pygments

# https://github.com/isaacs/nave
# needs npm, obviously.
# TODO: I think i'd rather curl down the nave.sh, symlink it into /bin and use that for initial node install.
npm install -g nave
#npm install -g yo
#npm install -g bower
#npm install -g gulp

sudo cp -f ./profile-el /etc/profile
sudo cp -f ./profile.d/* /etc/profile.d/
sudo chmod -R 644 /etc/profile
sudo chmod -R 755 /etc/profile.d

. /etc/profile
