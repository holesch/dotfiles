#!/bin/sh

PS4='>>> '
set -ex

git subtree pull --prefix tmux/plugins/sensible https://github.com/tmux-plugins/tmux-sensible master --squash
git subtree pull --prefix vim/pack/user/start/bitbake https://github.com/siho22/vim-bitbake master --squash
git subtree pull --prefix vim/pack/user/start/commentary https://github.com/tpope/vim-commentary master --squash
git subtree pull --prefix vim/pack/user/start/dispatch https://github.com/tpope/vim-dispatch master --squash
git subtree pull --prefix vim/pack/user/start/eunuch https://github.com/tpope/vim-eunuch master --squash
git subtree pull --prefix vim/pack/user/start/fugitive https://github.com/tpope/vim-fugitive master --squash
git subtree pull --prefix vim/pack/user/start/gutentags https://github.com/ludovicchabant/vim-gutentags master --squash
git subtree pull --prefix vim/pack/user/start/jq https://github.com/vito-c/jq.vim master --squash
# git subtree pull --prefix vim/pack/user/start/lion https://github.com/tommcdo/vim-lion master --squash # current: https://github.com/jonasw234/vim-lion
git subtree pull --prefix vim/pack/user/start/plantuml https://github.com/aklt/plantuml-syntax master --squash
git subtree pull --prefix vim/pack/user/start/recover https://github.com/chrisbra/Recover.vim master --squash
git subtree pull --prefix vim/pack/user/start/repeat https://github.com/tpope/vim-repeat master --squash
git subtree pull --prefix vim/pack/user/start/sneak https://github.com/justinmk/vim-sneak master --squash
git subtree pull --prefix vim/pack/user/start/surround https://github.com/tpope/vim-surround master --squash
git subtree pull --prefix vim/pack/user/start/targets https://github.com/wellle/targets.vim master --squash
git subtree pull --prefix vim/pack/user/start/tmux-navigator https://github.com/christoomey/vim-tmux-navigator master --squash
git subtree pull --prefix vim/pack/user/start/unimpaired https://github.com/tpope/vim-unimpaired master --squash
git subtree pull --prefix vim/pack/user/start/vinegar https://github.com/tpope/vim-vinegar master --squash
