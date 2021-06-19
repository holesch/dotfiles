#!/bin/sh -e

main() {
    update tmux/plugins/sensible tmux-plugins/tmux-sensible

    update_vim_pack bitbake siho22/vim-bitbake
    update_vim_pack commentary tpope/vim-commentary
    update_vim_pack fugitive tpope/vim-fugitive
    update_vim_pack gnuplot gagbo/vim-gnuplot
    update_vim_pack jq vito-c/jq.vim
    # not updating lion (tommcdo/vim-lion): replaced with jonasw234/vim-lion
    update_vim_pack plantuml aklt/plantuml-syntax
    update_vim_pack recover chrisbra/Recover.vim
    update_vim_pack repeat tpope/vim-repeat
    update_vim_pack dispatch tpope/vim-dispatch
    update_vim_pack eunuch tpope/vim-eunuch
    # not updating subversive
    update_vim_pack surround tpope/vim-surround
    update_vim_pack targets wellle/targets.vim
    update_vim_pack tmux-navigator christoomey/vim-tmux-navigator
    update_vim_pack toml cespare/vim-toml
    update_vim_pack unimpaired tpope/vim-unimpaired
    update_vim_pack vinegar tpope/vim-vinegar
}

update() {
    path="$1"
    url="$2"
    branch="${3:-master}"

    case "$url" in
    *://*) break;;
    *) url="https://github.com/$url"
    esac

    verbose git subtree pull --prefix "$path" "$url" "$branch" --squash
}

update_vim_pack() {
    path="vim/pack/user/start/$1"
    shift 1
    update "$path" "$@"
}

verbose() {
    echo ">>> $*"
    "$@"
}

main "$@"
