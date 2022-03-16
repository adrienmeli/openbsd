export LC_CTYPE="fr_FR.UTF-8"
xsetroot -solid "#969694"
# xsetroot -solid black &
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1 
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2 
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5
xset -b
slstatus &
spectrwm
#dwm
#cwm
#source ~/.bashrc

