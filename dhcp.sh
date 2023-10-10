!#/bin/bash
apt update
apt upgrade
apt install isc-dhcp-server
#Configuracion de la red

#Configuracion tarjeta

#Configuracion dhcp

systemctl restart isc-dhcp-server
systemctl status isc-dhcp-server
