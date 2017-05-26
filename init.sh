#!/bin/bash

#-------------------------------------------------------------------# 
# Install Vundle.vim
#-------------------------------------------------------------------# 
echo "[Install Vundle.vim submodule]"
exec git submodule update --init --recursive
#-------------------------------------------------------------------# 

#-------------------------------------------------------------------# 
# Symbolic Link Bash, Vim, GitConfig
#-------------------------------------------------------------------# 
echo "[Set Symbolid link]"
CURRENT_DIR=`pwd`

#-------------------------------------------------------------------# 
echo "[...Symbolic link set bash config]"
UNAMESTR=`uname`
if [ "${UNAMESTR}" == "Linux" ];then
	echo "ln -s ${CURRENT_DIR}/bash/bashrc ${HOME}/.bashrc"
elif [ "${UNAMESTR}" == "Darwin" ];then
	echo "ln -s ${CURRENT_DIR}/bash/bash_profile ${HOME}/.bash_profile"
else
	echo "Unknown OS"
fi
#-------------------------------------------------------------------# 

echo "[...Symbolic link set vim config]"
exec ln -s ${CURRENT_DIR}/vim/vimrc ${HOME}/.vimrc
exec ln -s ${CURRENT_DIR}/vim/vim ${HOME}/.vim

if [ ! -d "${HOME}/.config/nvim" ]; then
	exec mkdir ${HOME}/.config/nvim
fi
exec ln -s ${CURRENT_DIR}/vim/vimrc ${HOME}/.config/nvim/init.vim
#-------------------------------------------------------------------# 

