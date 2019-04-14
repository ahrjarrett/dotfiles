#!/bin/sh

# TODOS:
# 1. Delete symlinks to deleted files
#    - rsync might be good for this
# 2. TODO - regex here?

for file in $( ls -A | grep -vE $EXCLUDED_FILES ) ; do
  if [[ "$file" = ".ssh_config" ]] ; then
    mkdir -p "$HOME/.ssh"
    ln -sv "$PWD/.ssh_config" "$HOME/.ssh/config"
    echo "Symlinking complete"
  else 
    ln -sv "$PWD/$file" "$HOME"
  fi
done
