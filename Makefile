DOTFILES=tmux.conf vimrc hgrc gitconfig pydistutils.cfg xmodmap Xresources \
bash_logout bashrc gvimrc mplayer xinitrc xmobarrc xsession zshrc
install:
	for file in $(DOTFILES); do ln -fsn ~/dotfiles/$$file ~/.$$file; done
	mkdir -p ~/.config/awesome ~/.config/terminator
	ln -f -s ~/dotfiles/config/awesome/rc.lua ~/.config/awesome/rc.lua
	ln -f -s ~/dotfiles/config/terminator/config ~/.config/terminator/config
home: params.home
	. ./params.home; for file in *.tmpl; do \
	sed -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" $$file > $${file%%.tmpl}; \
	done
work: params.work
	. ./params.work; for file in *.tmpl; do \
	sed -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" $$file > $${file%%.tmpl}; \
	done
