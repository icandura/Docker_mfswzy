#!/bin/sh

PASS=${PASSWORD:-$(pwgen -s 12 1)}
_word=$( [ ${PASSWORD} ] && echo "preset" || echo "random" )
echo $(date)
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

#nohup /usr/sbin/httpd -DFOREGROUND &
nohup /usr/sbin/sshd -D