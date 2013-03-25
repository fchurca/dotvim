#! /bin/sh

ln -s ~/.vim/.vimrc ~
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c BundleInstall

