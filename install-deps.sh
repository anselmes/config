# up to you (me) if you want to run this as a file or copy paste at your leisure

# add global path
sudo /bin/sh -c "echo 'export PATH=/usr/local/bin:/usr/local/sbin:$PATH' >> /etc/profile"

# homebrew!
# you need the code CLI tools YOU FOOL.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
bash /usr/local/code/brew.sh

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# https://github.com/rupa/z
# z, oh how i love you
cd /usr/local/code
git clone https://github.com/rupa/z.git
chmod +x /usr/local/code/z/z.sh
# also consider moving over your current .z file if possible. it's painful to rebuild :)
# z binary is already referenced from .bash_profile


# https://github.com/dronir/SpotifyControl
# Spotify Controll Script
cd /usr/local/code
git clone git://github.com/dronir/SpotifyControl.git

# https://github.com/jeroenbegyn/VLCControl
# VLC Controll Script
cd /usr/local/code
git clone git://github.com/jeroenbegyn/VLCControl.git


# gems
gem install cocoapods

# for the c alias (syntax highlighted cat)
pip install Pygments

# https://github.com/isaacs/nave
# needs npm, obviously.
# TODO: I think i'd rather curl down the nave.sh, symlink it into /bin and use that for initial node install.
npm install -g nave
npm install -g yo
npm install -g bower
npm install -g gulp
