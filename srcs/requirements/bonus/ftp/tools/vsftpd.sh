#!/bin/bash

echo "local_root=/var/www/html" >> /etc/vsftpd.conf

useradd -m -s /bin/bash llopes-d
passwd llopes-d <<EOF
admin
admin
EOF

vsftpd