install:
	ln -f -s ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -f -s ~/dotfiles/vimrc ~/.vimrc
	ln -f -s ~/dotfiles/hgrc ~/.hgrc
	ln -f -s ~/dotfiles/gitconfig ~/.gitconfig
	ln -f -s ~/dotfiles/pydistutils.cfg ~/.pydistutils.cfg
	ln -f -s ~/dotfiles/xmodmap ~/.xmodmap
	mkdir -p ~/.config/awesome ~/.config/terminator
	ln -f -s ~/dotfiles/config/awesome/rc.lua ~/.config/awesome/rc.lua
	ln -f -s ~/dotfiles/config/terminator/config ~/.config/terminator/config
setparamshome: reset
	[ -f params.home ] && . ./params.home; sed -i -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" hgrc gitconfig
setparamswork: reset
	[ -f params.work ] && . ./params.work; sed -i -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" hgrc gitconfig
reset:
	git checkout hgrc
	git checkout gitconfig
