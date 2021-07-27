#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipv4.wildyproject.com);
echo "Script By geo"
clear
IP=$(wget -qO- ipv4.wildyproject.com);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH & OpenVPN Account Info"
echo -e "Isp Vps Name   : $ISP"
echo -e "Waktu          : $WKT"
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "============================="
echo -e "Host           : $IP"
echo -e "Domain         : ${domain}"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       : 109, 143"
echo -e "Port CDN       : 2052"
echo -e "SSL/TLS        : $ssl"
echo -e "Port Squid     : $sqd"
echo -e "============================="
echo -e "OpenVPN TCP    : http://$IP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN UDP    : http://$IP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN SSL    : http://$IP:81/client-tcp-ssl.ovpn"
echo -e "badvpn         : 7100-7300"
echo -e "============================="
echo -e "Expired On     : $exp"
echo -e "============================="
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}"[crlf]Upgrade: websocket[crlf][crlf]
echo -e ""
echo -e "Script By Geo"
