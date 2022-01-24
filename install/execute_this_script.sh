esxcli software vib install -d /tmp/ghettovcb/vghetto-ghettoVCB-offline-bundle.zip -f

mkdir -p /opt/ghettovcb/bin
cp /tmp/ghettovcb/bin/* /opt/ghettovcb/bin -f
chmod +x /opt/ghettovcb/bin/*
cp /tmp/ghettovcb/daily /opt/ghettovcb -f
cp /tmp/ghettovcb/monthly /opt/ghettovcb -f
cp /tmp/ghettovcb/restore.sh /opt/ghettovcb -f
cp crond.sh /etc/rc.local.d/
cp nic.sh /etc/rc.local.d/
chmod +x /tmp/crond.sh
chmod +x /tmp/nic.sh
/tmp/crond.sh
/tmp/nic.sh