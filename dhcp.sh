#!/bin/bash
apt update
apt upgrade
apt install isc-dhcp-server
#Configuracion de la red

#Configuracion tarjeta
sudo bash -c 'cat << EOF > /etc/default/isc-dhcp-server
# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#	Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp0s8"
INTERFACESv6=""
EOF
#Configuracion dhcp
sudo bash -c 'cat << EOF > /etc/dhcp/dhcp.conf


systemctl restart isc-dhcp-server
systemctl status isc-dhcp-server
