#!/bin/bash

echo "local_root=/var/www/html" >> /etc/vsftpd.conf

useradd -m -s /bin/bash $MY_USER
passwd $MY_USER <<EOF
$MY_USER_PW
$MY_USER_PW
EOF

vsftpd