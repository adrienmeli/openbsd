#! /bin/sh


# run as root

echo "permit :wheel" >> /etc/doas.conf
echo "permit persist :wheel" >> /etc/doas.conf

pkg_add vim spectrwm git conky bash dmenu


