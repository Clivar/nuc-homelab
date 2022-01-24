/bin/kill $(cat /var/run/crond.pid)
/bin/echo "0 4 1 1-12 * /opt/ghettovcb/bin/ghettoVCB.sh -a -g /opt/ghettovcb/monthly > /dev/null" >> /var/spool/cron/crontabs/root
/bin/echo "0 0 */2 * * /opt/ghettovcb/bin/ghettoVCB.sh -a -g /opt/ghettovcb/daily > /dev/null" >> /var/spool/cron/crontabs/root
/usr/lib/vmware/busybox/bin/busybox crond