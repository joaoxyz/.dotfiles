#!usr/bin/env bash

# Symlink already existing files and restore to correct version
stow -v --adopt */ -t ~
git restore .

# Deploy the remaining dotfiles
stow -vt ~ */
