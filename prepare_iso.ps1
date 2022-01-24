$baseProfile = "ESXi-7.0U2d-18538813-standard"   # See https://www.virten.net/vmware/vmware-esxi-image-profiles/ for available Image Profiles
Add-EsxSoftwareDepot https://hostupdate.vmware.com/software/VUM/PRODUCTION/main/vmw-depot-index.xml
Add-EsxSoftwareDepot .\Net-Community-Driver_1.2.2.0-1vmw.700.1.0.15843807_18835109.zip
Add-EsxSoftwareDepot .\ESXi702-VMKUSB-NIC-FLING-47140841-component-18150468.zip
$newProfile = New-EsxImageProfile -CloneProfile $baseProfile -name $($baseProfile.Replace("standard", "nuc")) -Vendor "virten.net"
Add-EsxSoftwarePackage -ImageProfile $newProfile -SoftwarePackage "net-community"
Add-EsxSoftwarePackage -ImageProfile $newProfile -SoftwarePackage "vmkusb-nic-fling"
Export-ESXImageProfile -ImageProfile $newProfile -ExportToIso -filepath "$($baseProfile.Replace("standard", "nuc")).iso"