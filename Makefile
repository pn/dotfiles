DOTFILES=tmux.conf vimrc hgrc gitconfig pydistutils.cfg xmodmap
install:
	for file in $(DOTFILES); do ln -f -s ~/dotfiles/$$file ~/.$$file; done
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
