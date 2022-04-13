#! /bin/sh


# run as user

# OpenBSD uses xsession, not xinitrc
cp /home/adrien/github/openbsd/home/.xsession ~/.xsession
# OpenBSD uses Xdefaults, not Xresources
cp /home/adrien/github/openbsd/home/.Xresources ~/.Xdefaults


# setting up ssh
# the first time you need an agent
eval `ssh-agent -s`
# don't close the terminal
ssh-keygen -t ed25519 -C "your_email@example.com"
# paste it into github
# cd into your git directory
git remote set-url origin git@github.com:username/your-repository.git




