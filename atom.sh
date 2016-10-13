#!/usr/env/bin bash

# install deps
brew install sourcekitten watchman
pip install flake8 yapf

# install nuclide
apm install nuclide

# install themes
apm install \
  genesis-ui \
  unity-ui

# install packages
apm install \
  haskell-grammar \
  highlight-selected \
  language-babel \
  language-ini \
  language-ocaml \
  language-swift \
  language-thrift \
  merge-conflicts \
  nuclide-format-js \
  sort-lines \
  tool-bar

# extra packages
apm install \
  advanced-open-file \
  atom-beautify \
  autoclose-html \
  color-picker \
  docblockr \
  emmet \
  file-icons \
  git-plus \
  language-docker \
  language-ignore \
  language-pug \
  language-vue \
  linter-csslint \
  linter-docker \
  linter-golint \
  linter-htmlhint \
  linter-js-yaml \
  linter-jscs \
  linter-jsonlint \
  linter-markdown \
  linter-pug \
  linter-ruby \
  linter-scss-lint \
  linter-swiftc \
  pigments \
  python-isort \
  regex-railroad-diagram \
  tidy-markdown \
  todo-show \
  tree-view-git-status

# installing custom packages
apm install \
  https://github.com/sanselme/snips

# copying config and keymap
cp -f ./*.cson ~/.atom/
