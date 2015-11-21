Installation
------------

- run ``make install``
- update ``USERNAME`` and ``EMAIL`` in *params* file
- run ``make setparams``

Update
------

- run ``make reset``
- run ``git pull``
- run ``make setparams``

Check if there are some files not linked to dotfiles dir ``make linktest``

Then install missing links with ``make link``

Recommended packages
--------------------

awesome-extra ranger feh caca-utils atool mediainfo poppler-utils lynx highlight
- suckless-tools - slock

For gnome terminal use this to update colors:
https://github.com/Anthony25/gnome-terminal-colors-solarized
