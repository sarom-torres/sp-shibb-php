
if ! egrep "ServerASNDASDNUSU" /etc/apache2/apache2.conf > /dev/null 2>&1
then
	echo "exite"
else
	echo "n existe"
fi
