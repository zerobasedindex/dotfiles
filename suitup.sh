#!/bin/bash

checkBrewTap() {
	brew tap | grep $1 2>&1 > /dev/null
}

echo -n "Checking for 'brew'..."
which brew 2>&1 > /dev/null
if [ $? != 0 ]; then
	echo "Missing. Installing..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Installed"
fi

echo -n "Checking for 'pick'..."
which pick 2>&1 > /dev/null
if [ $? != 0 ]; then
	echo "Missing. Installing..."
	echo "======================"
	brew tap thoughtbot/formulae
	brew install pick
	echo "======================"
else
	echo "Installed"
fi

echo -n "Checking for 'git'..."
which git 2>&1 > /dev/null
if [ $? != 0 ]; then
	echo "Missing"
else
	echo "Installed. Configuring git"
	git config --global user.email "cody.zbi@gmail.com"
	git config --global user.name "Cody Henthorne"
	git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	git config --global alias.satus "status"
	git config --global push.default simple
fi

echo "source ~/.suitup/suitup_bash_profile.sh" >> ~/.bash_profile