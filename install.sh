#!/bin/sh

is_ubuntu() {
	lsb_release -a | grep -i Ubuntu
}

if [ -z is_ubuntu ]
then
	echo "Ubuntu is not detected."
	exit 1;
fi

echo "Updating sources"
sudo apt-get update
sudo apt-get -y dist-upgrade && sudo apt-get upgrade -y

echo "Installing i3"
sudo apt-get install -y i3
