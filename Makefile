install: setparams
	ln -f -s ~/dotfiles/tmux.conf ~/.tmux.conf
	ln -f -s ~/dotfiles/vimrc ~/.vimrc
	ln -f -s ~/dotfiles/hgrc ~/.hgrc
	ln -f -s ~/dotfiles/gitconfig ~/.gitconfig
	ln -f -s ~/dotfiles/pydistutils.cfg ~/.pydistutils.cfg
	mkdir -p ~/.config/awesome ~/.config/terminator
	ln -f -s ~/dotfiles/config/awesome/rc.lua ~/.config/awesome/rc.lua
	ln -f -s ~/dotfiles/config/terminator/config ~/.config/terminator/config
setparams:
	[ -f params ] && . ./params; sed -i -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" hgrc gitconfig
reset:
	git checkout hgrc
	git checkout gitconfig
