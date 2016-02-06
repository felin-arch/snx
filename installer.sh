#!/bin/sh
USER_BIN=$1
install -o 0 -g 0 -m=u=rxs,g=x,o=x snx $USER_BIN/snx
install -o 0 -g 0 -m=u=rx,g=x,o=x SNX_Install_Tool $USER_BIN/SNX_Install_Tool
install -o 0 -g 0 -m=u=rx,g=rx,o=rx snx_uninstall.sh $USER_BIN/snx_uninstall
install -d -o 0 -g 0 -m 0700 /etc/snx
install -d -o 0 -g 0 -m=u=rwx /etc/snx/tmp
#the vg app
install -d -o 0 -g 0 -m=u=rwx /etc/snx/CAverify.app/Contents/MacOS
install -d -o 0 -g 0 -m=u=rwx /etc/snx/CAverify.app/Contents/Resources
install -o 0 -g 0 -m=u=rx,g=x CAverify /etc/snx/CAverify.app/Contents/MacOS
install -o 0 -g 0 -m=u=rw,g=rw Info.plist.CAverify /etc/snx/CAverify.app/Contents/Info.plist
install -o 0 -g 0 -m=u=rw,g=rw snx1.icns /etc/snx/CAverify.app/Contents/Resources/snx1.icns

#clean vna driver and tuntap
kextunload -q /etc/snx/vna.kext
rm -rf /etc/snx/vna.kext 2> /dev/null 
kextunload -q /Library/Extensions/tunSNX/tun.kext
rm -rf /Library/Extensions/tunSNX/tun.kext 2> /dev/null 
