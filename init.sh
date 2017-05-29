#!/bin/bash

#-------------------------------------------------------------------# 
# Install Vundle.vim
#-------------------------------------------------------------------# 
echo "[Install Vundle.vim submodule]"
git submodule update --init --recursive
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
	if [ -f "${HOME}/.bashrc" ]; then
		mv ${HOME}/.bashrc ${HOME}/.bashrc_orig
	fi
	ln -s ${CURRENT_DIR}/bash/bashrc ${HOME}/.bashrc
elif [ "${UNAMESTR}" == "Darwin" ];then
	if [ -f "${HOME}/.bash_profile" ]; then
		mv ${HOME}/.bash_profile ${HOME}/.bash_profile_orig
	fi
	ln -s ${CURRENT_DIR}/bash/bash_profile ${HOME}/.bash_profile
else
	echo "Unknown OS"
fi
#-------------------------------------------------------------------# 

echo "[...Symbolic link set vim config]"
if [ -f "${HOME}/.vimrc" ];then
	mv ${HOME}/.vimrc ${HOME}/.vimrc_orig
fi
ln -s ${CURRENT_DIR}/vim/vimrc ${HOME}/.vimrc

if [ -d "${HOME}/.vim" ]; then
	mv ${HOME}/.vim ${HOME}/.vim_orig
fi
ln -s ${CURRENT_DIR}/vim/vim ${HOME}/.vim

if [ ! -d "${HOME}/.config/nvim" ]; then
	mkdir ${HOME}/.config/nvim
fi

if [ -f "${HOME}/.config/nvim/init.vim" ];then
	mv ${HOME}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim_orig
fi
ln -s ${CURRENT_DIR}/vim/vimrc ${HOME}/.config/nvim/init.vim
#-------------------------------------------------------------------# 

#-------------------------------------------------------------------# 
# Install vim plugins
#-------------------------------------------------------------------# 
echo "[Install vim plugins]"
vim +PluginInstall +qall

