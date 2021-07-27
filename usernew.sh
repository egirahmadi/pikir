#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
WKT=$(curl -s ipinfo.io/timezone )
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Script By Geo"
clear
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP2
fi
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- ifconfig.me/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
sleep 1
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
echo -e ""
echo -e "PAYLOAD :"
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}"[crlf]Upgrade: websocket[crlf][crlf]
echo -e ""
echo -e "Script By Geo"
