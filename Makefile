FILES=files/
REPOS=repos/oh-my-zsh repos/dircolors repos/tmux-powerline
DOTFILES=tmux.conf vimrc hgrc gitconfig pydistutils.cfg xmodmap Xresources \
bash_logout bashrc gvimrc mplayer xinitrc xmobarrc xsession zshrc \
gtkrc-2.0 oh-my-zsh tmux-powerlinerc vimperatorrc

install: $(REPOS) link
	echo "You may run 'make fonts' if you need."

link:
	find ${FILES} -type d | while read f; do mkdir -p ~/.$${f#${FILES}}; done
	find ${FILES} -type f | while read f; do ln -fsn ~/dotfiles/$$f ~/.$${f#files/}; done
	for f in repos/*; do ln -fsn ~/dotfiles/$$f ~/.$${f#repos/}; done

repos/oh-my-zsh:
	git clone git://github.com/robbyrussell/oh-my-zsh.git repos/oh-my-zsh

repos/dircolors:
	git clone https://github.com/seebi/dircolors-solarized repos/dircolors

repos/tmux-powerline:
	test -d repos/tmux-powerline || git clone https://github.com/erikw/tmux-powerline repos/tmux-powerline
	cp mytmux-theme.sh repos/tmux-powerline/themes/

fonts:
	mkdir -p ~/.fonts
	cd ~/.fonts && wget -nc https://gist.github.com/qrush/1595572/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf
	cd ~/.fonts && test -d powerline-fonts || git clone https://github.com/Lokaltog/powerline-fonts
	fc-cache -vf ~/.fonts
	echo "Choose Inconsolaa-dz for Powerline in gnome-terminal preferenes"

home: params.home
	. ./params.home; for file in *.tmpl; do \
	sed -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" $$file > ${FILES}$${file%%.tmpl}; \
	done

work: params.work
	. ./params.work; for file in *.tmpl; do \
	sed -e "s/__USERNAME__/$${USERNAME:-$$USER}/" \
		-e "s/__EMAIL__/$${EMAIL:-$$USER@$$(hostname)}/" $$file > ${FILES}$${file%%.tmpl}; \
	done

.PHONY: fonts repos/tmux-powerline
