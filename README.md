# Arch Linux Mainline Kernel on ASUS C201PA Rockchip
### Only tested with LibreBoot BIOS
This is not intended to be a foolproof how-to/guide on how to install
Arch Linux Arm Mainline or otherwise on the Asus C201PA Chromebook.
This is intended to be helpful information for those who want to 
run the mainline kernel on their Chromebooks.


### Libreboot download, for those who want it. [LINK](https://www.mirrorservice.org/sites/libreboot.org/release/stable/20160902/rom/depthcharge/)

### Recommend to back these up from the Chromebook
* /usr/bin/cgpt
* /usr/bin/dump_kernel_config
* /usr/bin/vbutil_kernel
* /usr/share/vboot/
* /usr/share/vboot/devkeys

## Packages Needed
* uboot-tools
* vboot-utils
### Mainline Kernel
* linux-armv7
* linux-armv7-chromebook

## Copy the Files - if the distribution does not have them
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
