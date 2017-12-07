# Arch Linux Mainline Kernel on ASUS C201PA Rockchip
### Have only tested with LibreBoot BIOS
This is not intended to be a foolproof how-to/guide on how to install
Arch Linux Arm Mainline or otherwise on the Asus C201PA Chromebook.
This is intended to be helpful information for those who want to 
run the mainline kernel on their Chromebooks.

## Recommended Packages
### If you really want LibreBoot, but like me couldn't find a link the first six times. [LINK](https://www.mirrorservice.org/sites/libreboot.org/release/stable/20160902/rom/depthcharge/)
* Lightdm-gtk-greeter
* XFCE4, enable display compositing in window manager tweaks.
* networkmanager and network-manager-applet
* gnome-keyring
* TLP
* uboot-tools (for kernel signing)

## Working
* Touchpad
* Wifi
* microSD-Card reader
* eMMC Disk

## Not working
* Suspend with lid closed.
* Wi-fi card after suspend.

# Getting Mainline Kernel on Arch
It is assumed that the reader is familiar with:
* Chromebook Developer mode
* Arch Linux Arm with Chromebook Kernel (3.14)

If not, there are recourses:
* Arch Linux Arm guide for Asus Chromebook Flip C100P (same CPU), very good guide.
* The Arch Wiki

### Recommend backing these up from Chromebook
* /usr/bin/cgpt
* /usr/bin/dump_kernel_config
* /usr/bin/vbutil_kernel
* /usr/share/vboot/
### Required
* /usr/share/vboot/devkeys

## Packages Needed
* uboot-tools
* vboot-utils
### Mainline Kernel
* linux-armv7
* linux-armv7-chromebook

## Copy the Files
In Arch Linux Arm copy the backed up directory `/usr/share/vboot/devkeys`
from ChromeOS to Arch Linux. After copying you should have the devkeys 
folder in `/usr/share/vboot/`, where the devkeys folder has all the devkey
files.

## Configure the Script
In the last line of the script change `null` to the appropriate 
partition that the bootloader is to be written to.

## Run the Script
`sudo ./sign_kernel_full.sh`

# Index
### Adapted from atopuzovic's post on archlinuxarm.org
* sign_kernel_full.sh
* cmdline
* kernel.its
### From the Arch Linux Arm Veyron image
* vmlinux.kpart
