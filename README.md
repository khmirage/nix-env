## System Configure 

### This project is **bash, zsh, vim, git** setting for Linux / Mac 
---

#### [Bash]
---
```
	bash_profile - for mac
	bashrc - for linux

	Symlink to $HOME
		bash_profile -> ~/.bash_profile
		bashrc -> ~/.bashrc
```

#### [Vim]
---
```
	vimrc - vim setting file
	vim - vundle submodule

	1. vundle submodule pull
		$ git submodule init
		$ git submodule update
	2. Symlink to $HOME
		vim -> ~/.vim
		vimrc -> ~/.vimrc
```

#### [NeoVim]
---
```
	init.vim - vim 설정파일과 같이 사용하도록 설정
	$ cp -R nvim ~/.config
	or
	$ ln -sf nvim ~/.config/
```

#### [Git]
---
```
	git global config

	Symlink to $HOME
		gitconfig -> ~/.gitconfig
```

#### [Zsh]
---
  - [site: oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  - oh-my-zsh install
  ```
  $ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  ```

  - submodule
  ```
  $ git submodule init
  $ git submodule update
  ```

  - symlink
  ```
  $ rm -rf ~/.oh-my-zsh/custom
  $ ln -sf ${PRJ}/shell/oh-my-zsh/custom ~/.oh-my-zsh/custom
  ```


