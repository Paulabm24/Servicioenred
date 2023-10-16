#!/bin/bash
apt update
apt upgrade
apt install isc-dhcp-server
#Configuracion de la red
sudo bash -c 'cat << EOF > /etc/network/interfaces


#Configuracion tarjeta
sudo bash -c 'cat << EOF > /etc/default/isc-dhcp-server
# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#	Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enp0s8"
INTERFACESv6=""
EOF
#Configuracion dhcp
sudo bash -c 'cat << EOF > /etc/dhcp/dhcp.conf
authoritative;
ddns-update-style none;

failover peer "FAILOVER" {
  primary; 
  address 192.168.2.3;
  port 647;
  peer address 192.168.2.4;
  peer port 647;
  max-unacked-updates 10;
  max-response-delay 30;
  load balance max seconds 3;
  mclt 1800;
  split 128;
}

subnet 192.168.2.0 netmask 255.255.255.0 {
  option broadcast-address 192.168.2.255;
  option routers 192.168.2.1;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  pool {
    failover peer "FAILOVER";
    max-lease-time 3600;
    range 192.168.2.13 192.168.2.16;
  }
}
EOF

systemctl restart isc-dhcp-server
systemctl status isc-dhcp-server
