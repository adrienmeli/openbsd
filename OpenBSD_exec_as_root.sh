#! /bin/sh

# update
fw_update

# wifi
ifconfig
vim /etc/hostname.XXX
# join ssid wpa_key XXX
# dhcp

# mount USB keys
/usr/local/libexec/hotplug-diskmount init
rcctl enable hotplugd
echo hotplugd_flags= >> /etc/rc.conf.local

# run as root

echo "permit :wheel" >> /etc/doas.conf
echo "permit persist :wheel" >> /etc/doas.conf

pkg_add vim spectrwm git conky bash dmenu arandr zathura rsync bash fzf ibm-plex scrot

# disable console: comment out the console line
vim /etc/X11/xenodm/Xsetup_0

# performance
vim /etc/login.conf

# fstab
vim /etc/fstab
# add noatime,softdep to /home disk 

# add user to staff
usermod -G staff adrien

# save battery life
rcctl enable apmd
rcctl set apmd flags -A
rcctl start apmd

# suspend
mkdir /etc/apm
touch /etc/apm/suspend

print "#!/bin/sh\npkill -USR1 xidle" > /etc/apm/suspend
chmod +x /etc/apm/suspend
