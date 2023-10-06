# dotfiles

1.   echo ".cfg" >> .gitignore

There could be weird behaviour if .cfg tries to track itself. Avoid recursive issues by adding .cfg to your global Git ignore.

 
2.   git clone https://github.com/bananawrap/dotfiles $HOME/.cfg

Add a --bare flat if you wish you use a bare repo

 
3.   alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

Set up an alias to send Git commands to .cfg, and also set $HOME as the work tree, while storing the Git state at .cfg

For a bare repo, the path to the Git directory is at the top level of the project: $HOME/.cfg/

For a non-bare default repo, the path to the Git directory is inside a .git subdirectory: $HOME/.cfg/.git

 
4.   config config --local status.showUntrackedFiles no

Set a local configuration in .cfg to ignore untracked files.

 
5.   config checkout

Checkout the actual content from your .cfg repository to $HOME. Git pulls the tracked files out of the compressed database in the Git directory and places them in the work tree.
