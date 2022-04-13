# $OpenBSD: dot.profile,v 1.7 2020/01/24 02:09:51 okan Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
export PATH HOME TERM

HOSTCHAR=adrien
PS1="$HOSTCHAR"':${PWD#HOME/}:!$ '
#export PS1='$(battery)\h:\w\$ '

# no duplicates
HISTCONTROL=ignoredumps
HISTFILESIZE=5000
HISTSIZE=100
HISTFILE=~/.sh_history

#set -o vi



export ENV=$HOME/.kshrc

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='colorls -GF'

battery()
{
	local bat=""
	local level=""
	local charg=""
	bat=$(apm -b 2>/dev/null)
	if [ -n "$bat" -a "$bat" -lt "4" ]; then
		level=$(apm -l 2>/dev/null)
		charg=$(apm -a 2>/dev/null)
		if [ -n "$charg" -a "$charg" -eq "1" ]; then
			#charging
			print -- "\033[01;32m$level%\033[00m"
		else
			if [ "$level" -lt "20" ]; then
				#print red
				print -- "\033[01;31m$level%\033[00m"
			else 
				#print blue
				print -- "\033[01;34m$level%\033[00m"
			fi
		fi
	else
		#no battery
		print -- ""
	fi
}

#eval `ssh-agent -s`
