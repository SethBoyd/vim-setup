#!/bin/bash -e
sudo apt-get install cmake python-dev exuberant-ctags ack-grep libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev ruby-dev mercurial

sudo apt-get remove vim vim-runtime gvim

cd ~
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim73
sudo make install

sudo npm install -g jsctags coffee-script coffeelint

cd ~/.vim/bundle/YouCompleteMe/
./install.sh --clang-completer

