REPOS=oh-my-zsh dircolors-solarized
DOTFILES=tmux.conf vimrc hgrc gitconfig pydistutils.cfg xmodmap Xresources \
bash_logout bashrc gvimrc mplayer xinitrc xmobarrc xsession zshrc gtkrc-2.0 \
oh-my-zsh

install: $(REPOS) link
	echo "You may run 'make fonts' if you need."

link:
	for file in $(DOTFILES); do ln -fsn ~/dotfiles/$$file ~/.$$file; done
	mkdir -p ~/.config/awesome ~/.config/terminator
	ln -f -s ~/dotfiles/config/awesome/rc.lua ~/.config/awesome/rc.lua
	ln -f -s ~/dotfiles/config/terminator/config ~/.config/terminator/config

oh-my-zsh:
	git clone git://github.com/robbyrussell/oh-my-zsh.git oh-my-zsh

dircolors-solarized:
	git clone https://github.com/seebi/dircolors-solarized

fonts:
	mkdir -p ~/.fonts
	cd ~/.fonts && wget -nc https://gist.github.com/qrush/1595572/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf
	cd ~/.fonts && test -d powerline-fonts || git clone https://github.com/Lokaltog/powerline-fonts
	fc-cache -vf ~/.fonts
	echo "Choose Inconsolaa-dz for Powerline in gnome-terminal preferenes"

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

.PHONY: fonts
