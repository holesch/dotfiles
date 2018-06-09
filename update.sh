#!/bin/bash
set -ex

git submodule foreach git pull origin master
git submodule update --init --recursive

git subtree pull --prefix base16-shell https://github.com/chriskempson/base16-shell master --squash
git subtree pull --prefix gibo https://github.com/simonwhitaker/gibo master --squash
git subtree pull --prefix tmux/plugins/sensible https://github.com/tmux-plugins/tmux-sensible master --squash
git subtree pull --prefix vim/pack/user/start/airline https://github.com/vim-airline/vim-airline master --squash
git subtree pull --prefix vim/pack/user/start/airline-themes https://github.com/vim-airline/vim-airline-themes master --squash
git subtree pull --prefix vim/pack/user/start/base16-color https://github.com/chriskempson/base16-vim master --squash
git subtree pull --prefix vim/pack/user/start/bitbake https://github.com/siho22/vim-bitbake master --squash
git subtree pull --prefix vim/pack/user/start/commentary https://github.com/tpope/vim-commentary master --squash
git subtree pull --prefix vim/pack/user/start/ctrlp https://github.com/ctrlpvim/ctrlp.vim master --squash
git subtree pull --prefix vim/pack/user/start/eunuch https://github.com/tpope/vim-eunuch master --squash
git subtree pull --prefix vim/pack/user/start/fugitive https://github.com/tpope/vim-fugitive master --squash
git subtree pull --prefix vim/pack/user/start/gutentags https://github.com/ludovicchabant/vim-gutentags master --squash
git subtree pull --prefix vim/pack/user/start/neocomplete https://github.com/Shougo/neocomplete.vim master --squash
git subtree pull --prefix vim/pack/user/start/repeat https://github.com/tpope/vim-repeat master --squash
git subtree pull --prefix vim/pack/user/start/sensible https://github.com/tpope/vim-sensible master --squash
git subtree pull --prefix vim/pack/user/start/surround https://github.com/tpope/vim-surround master --squash
git subtree pull --prefix vim/pack/user/start/tmux-navigator https://github.com/christoomey/vim-tmux-navigator master --squash
git subtree pull --prefix vim/pack/user/start/unimpaired https://github.com/tpope/vim-unimpaired master --squash
git subtree pull --prefix vim/pack/user/start/vinegar https://github.com/tpope/vim-vinegar master --squash
