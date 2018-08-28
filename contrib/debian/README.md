
Debian
====================
This directory contains files used to package nullexd/nullex-qt
for Debian-based Linux systems. If you compile nullexd/nullex-qt yourself, there are some useful files here.

## nullex: URI support ##


nullex-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install nullex-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your nullexqt binary to `/usr/bin`
and the `../../share/pixmaps/nullex128.png` to `/usr/share/pixmaps`

nullex-qt.protocol (KDE)

