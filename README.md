# Schubert's dotfiles (inspired by Paul Irish's dotfiles)

[mathias's readme](https://github.com/mathiasbynens/dotfiles/) is awesome. go read it.

## Install the necessary apps
My basic setup is captured in `install-deps.sh` (`install-deps-el.sh` for EL) which adds homebrew (OS X only), z, nave, etc.

## Private config
Toss it into a file called `.extra` which you do not commit to this repo and just keep in your `~/`

## Syntax highlighting
…is really important. even for these files.
Install [Dotfiles Syntax Highlighting](https://github.com/mattbanks/dotfiles-syntax-highlighting-st2) via [Sublime Text 2 Package Control](http://wbond.net/sublime_packages/package_control)

## Similar projects
I recommend getting a [`.jshintrc`](https://github.com/jshint/node-jshint/blob/master/.jshintrc) and [`.editorconfig`](http://editorconfig.org/) defined for all your projects.

## Overview of files

####  Automatic config
* `.ackrc` - for ack (better than grep)
* `.vimrc`, `.vim` - vim config
* `brew.sh` - homebrew initialization (OS X only)
* `spf13-vim.sh` - vim spf13

#### Shell environment
* `.bashrc`
* `.extra` - not included, explained above
* `.vimrc.local` - local vimrc
* `.profile`
* `profile`
* `profile-el`
* `profile.d`

#### Manual run
* `install-deps.sh` - random apps I need installed (OS X)
* `install-deps-el.sh` - random apps I need installed (EL)

#### Git
* `.git`
* `.gitconfig`
* `.gitignore`
* `.inputrc` - config for bash readline

## Installation

```bash
git clone https://github.com/sanselme/dotfiles.git && cd dotfiles && ./install-deps (./install-deps-el for EL) && ./sync.sh
```

To update later on, just run the sync again.

___

## License

The MIT License (MIT)

Copyright (c) 2015 Schubert Anselme

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
