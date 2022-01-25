# Homelab
Bootstrap a nuc with ESXi
- Use Ghettovcb as backup solution
- Build an ESXi installation ISO with USB nic fling and e1000n ethernet driver
- Cron job for monthly and daily backups
- Boot script to initialise multiple USB nics
- Backup/Restore ESXi configuration

## Getting started
1. Copy the contents of the `install` directory to `/tmp/` on the ESXi host
2. Run `execute_this_script.sh`