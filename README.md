# Schubert's dotfiles (inspired by Paul Irish's dotfiles)

[mathias's readme](https://github.com/mathiasbynens/dotfiles/) is awesome. go read it.

## install the necessary apps

My basic setup is captured in `install-deps.sh` (`install-deps-el.sh` for EL) which adds homebrew (OS X only), z, nave, etc.

## private config

Toss it into a file called `.extra` which you do not commit to this repo and just keep in your `~/`

## Syntax highlighting

…is really important. even for these files.

Install [Dotfiles Syntax Highlighting](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2) via [Sublime Text 2 Package Control](http://wbond.net/sublime_packages/package_control)


### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

## Similar projects

I recommend getting a [`.jshintrc`](https://github.com/jshint/node-jshint/blob/master/.jshintrc) and [`.editorconfig`](http://editorconfig.org/) defined for all your projects.





## overview of files

####  Automatic config
* `.ackrc` - for ack (better than grep)
* `.vimrc`, `.vim` - vim config, obv.
* `brew.sh` - homebrew initialization (OS X only)
* `spf13-vim.sh` - vim spf13

#### shell environment
* `.bashrc`
* `.extra` - not included, explained above
* `.vimrc.local` - local vimcr
* `.profile`
* `profile`
* `profile-el`
* `profile.d`

#### manual run
* `install-deps.sh` - random apps I need installed (OS X)
* `install-deps-el.sh` - random apps I need installed (EL)
* `.osx` - run on a fresh OS X machine

#### git, brah
* `.git`
* `.gitconfig`
* `.gitignore`
* `.inputrc` - config for bash readline


## Installation

```bash
git clone https://github.com/sanselme/dotfiles.git && cd dotfiles && ./install-deps (./install-deps-el for EL) && ./sync.sh
```

To update later on, just run the sync again.

License
*******
See LICENSE.txt file for more information
