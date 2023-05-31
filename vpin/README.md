# Information
These are the scripts I've used on my homemade DNS and VPN.
Don't expect any vital information to get out about this other thani
that it's OpenBSD on a Raspbery Pi Model 4

Reminder of installation:

To boot into OpenBSD on the Pi 4 you need:
- A USB with install.img + [UEFI Firmware](https://github.com/pftf/RPi4/)
- The Pi set to boot from USB with the installation target connected

After that, install OpenBSD and shutdown. Then take the USB, `fdisk /dev/sdX`
and remove the second partition. Reboot the Pi let the bootloader find the 
OpenBSD partition and then login. Mount the boot partition and add the UEFI 
Firmware. The boot partition by default is `/dev/sdXi`. Unmount, reboot,
remove the USB and enjoy! 
