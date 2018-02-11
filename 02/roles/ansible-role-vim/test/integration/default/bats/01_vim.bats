#!/usr/bin/env bats

@test "vim is installed" {
    run vim --version
    [ "$status" -eq 0 ]
}

@test "My vimrc is installed" {
    run grep "execute pathogen#infect()" /root/.vimrc
}
