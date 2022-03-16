#! /bin/sh


# run as root

echo "permit :wheel" >> /etc/doas.conf
echo "permit persist :wheel" >> /etc/doas.conf

pkg_add vim spectrwm git conky bash dmenu arandr zathura rsync bash fzf ibm-plex scrot

# disable console: comment out the console line
vim /etc/X11/xenodm/Xsetup_0

