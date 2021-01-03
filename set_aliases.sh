#! /bin/bash

#Script used to set my aliases

function CreateMyAliases(){
	if [ -f ~/.MyBashAliases ]; then
		cp ~/.MyBashAliases ~/.MyBashAliases-old
		rm ~/.MyBashAliases
	fi
cat <<EOF > ~/.MyBashAliases
	
	unalias ll
	alias ll='ls -alhF'
	
	unalias cd..
	alias cd..='cd ..'
	
	unalias ..
	alias ..='cd ..'
	
	unalias now
	alias now='date'
	
	unalias ping
	alias ping='ping -c 5'
	
	unalias ports
	alias ports='netstat -tulanp'
	
	unalias meminfo
	alias meminfo='free -mlth'
EOF

}

if [ -f ~/.bashrc ]; then
	# backup
	cp ~/.bashrc ~/.bashrc_old
	
	# Function call
	CreateMyAliases
	
	# finding and removing previous set
	#sed -i '~/.MyBashAliases' ~/.bashrc
	
	# adding new set
	echo '\nsource ~/.MyBashAliases' >> ~/.bashrc
	
	echo "Close and reopen terminal to changes take effect (or source .bashrc)"
fi