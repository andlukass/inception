#!/bin/bash

echo "local_root=/var/www/html" >> /etc/vsftpd.conf
echo "pasv_min_port=8010" >> /etc/vsftpd.conf
echo "pasv_max_port=8040" >> /etc/vsftpd.conf
echo "pasv_enable=yes" >> /etc/vsftpd.conf
echo "write_enable=yes" >> /etc/vsftpd.conf

useradd -m -s /bin/bash $MY_USER
passwd $MY_USER <<EOF
$MY_USER_PW
$MY_USER_PW
EOF

vsftpd