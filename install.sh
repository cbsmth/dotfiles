#!/bin/sh
# Creates symlinks in ~/; backups any preexisting dotfiles.
# Last modified: 2012-05-10
# Fredrik Karlström <fredrik@cbsmth.se>

dfdir=~/dotfiles
backupdir=~/dotfiles_backup

# Create a backup directory
echo "Creating $backupdir for preexisting dotfiles."
mkdir -p $backupdir

# Now cd to our dotfiles directory
cd $dfdir

# Symlink dotfiles from ~/
echo "Installing dotfiles.\n---"
for filename in `ls -ABd .* |grep -Ev "^(\.hg|\.hgignore|\.|\.\.)$"`
do
	if [ -f ~/$filename ]
	then
		echo "$filename already exists; moving to $backupdir"
		mv ~/$filename $backupdir/
	fi
	echo "Creating symlink for $filename"
	ln -s $dfdir/$filename ~/$filename
done
echo "---\nDone."
