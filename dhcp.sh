#!/bin/bash
apt update
apt upgrade
apt install isc-dhcp-server
#Configuracion de la red

#Configuracion tarjeta
sudo bash -c 'cat << EOF > /etc/default/isc-dhcp-server

#Configuracion dhcp

systemctl restart isc-dhcp-server
systemctl status isc-dhcp-server
