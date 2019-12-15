Installation
------------

- ``apt-get install $(cat packages)``
- `systemctl enable acpid`
- update ``USERNAME`` and ``EMAIL`` in *params* file
- run ``make home`` or ``make work``
- run ``make install``

Sample *params.home*:

    USERNAME="Firstname Lastname"

    EMAIL="firstname.lastname@example.com"

Update
------

- run ``make reset``
- run ``git pull``
- run ``make home`` or ``make work``

Check if there are some files not linked to dotfiles dir ``make linktest``

Then install missing links with ``make link``

Recommended packages
--------------------

awesome-extra ranger feh caca-utils atool mediainfo poppler-utils lynx highlight
- suckless-tools - slock

For gnome terminal use this to update colors:
https://github.com/Anthony25/gnome-terminal-colors-solarized
