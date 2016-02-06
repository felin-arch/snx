#!/bin/sh

IsNotSuperUser()
{
	if [ `id -u` != 0 ]
	then
		return 0
	fi

	return 1
}

if IsNotSuperUser
then
	#run snx_uninstall from the SNX_Install_Tool
	/usr/bin/SNX_Install_Tool /usr/bin/snx_uninstall 2> /dev/null 
else
if [ -f /usr/bin/snx ]
then
/usr/bin/snx -d > /dev/null
fi
kextunload -q /etc/snx/vna.kext
kextunload -q /Library/Extensions/tunSNX/tun.kext
rm -rf /Library/Extensions/tunSNX 2> /dev/null
rm -f /usr/bin/snx 2> /dev/null 
rm -f /usr/bin/snx_uninstall 2> /dev/null
rm -rf /etc/snx > /dev/null 2> /dev/null
rm -f /usr/bin/SNX_Install_Tool 2> /dev/null
fi
