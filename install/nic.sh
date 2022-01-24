vusb0_status=$(esxcli network nic get -n vusb0 | grep 'Link Status' | awk '{print $NF}')
vusb1_status=$(esxcli network nic get -n vusb1 | grep 'Link Status' | awk '{print $NF}')

count=0
while [[ $count -lt 20 && "${vusb0_status}" != "Up" ]]
do
    sleep 10
    count=$(( $count + 1 ))
    vusb0_status=$(esxcli network nic get -n vusb0 | grep 'Link Status' | awk '{print $NF}')
done

count=0
while [[ $count -lt 20 && "${vusb1_status}" != "Up" ]]
do
    sleep 10
    count=$(( $count + 1 ))
    vusb0_status=$(esxcli network nic get -n vusb1 | grep 'Link Status' | awk '{print $NF}')
done

if [ "${vusb0_status}" = "Up" ]; then
    esxcfg-vswitch -L vusb0 vSwitchWAN
    esxcfg-vswitch -M vusb0 -p "WAN" vSwitchWAN
    sleep 1
    esxcli network nic down -n vusb0
    sleep 1
    esxcli network nic up -n vusb0
fi

if [ "${vusb1_status}" = "Up" ]; then
    esxcfg-vswitch -L vusb1 vSwitchSync
    esxcfg-vswitch -M vusb1 -p "Health" vSwitchSync
    sleep 1
    esxcli network nic down -n vusb1
    sleep 1
    esxcli network nic up -n vusb1
fi