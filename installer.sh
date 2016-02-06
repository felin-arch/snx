#!/bin/sh
install -d -o 0 -g 0 -m 0700 /etc/snx
install -d -o 0 -g 0 -m=u=rwx /etc/snx/tmp
#the vg app
install -d -o 0 -g 0 -m=u=rwx /etc/snx/CAverify.app/Contents/MacOS
install -d -o 0 -g 0 -m=u=rwx /etc/snx/CAverify.app/Contents/Resources
install -o 0 -g 0 -m=u=rx,g=x CAverify /etc/snx/CAverify.app/Contents/MacOS
install -o 0 -g 0 -m=u=rw,g=rw Info.plist.CAverify /etc/snx/CAverify.app/Contents/Info.plist
install -o 0 -g 0 -m=u=rw,g=rw snx1.icns /etc/snx/CAverify.app/Contents/Resources/snx1.icns
