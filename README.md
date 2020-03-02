# Arch Linux Mainline Kernel on ASUS C201PA Rockchip

#### Libreboot download, for those who want it. [LINK](https://www.mirrorservice.org/sites/libreboot.org/release/stable/20160902/rom/depthcharge/)

### About Libreboot
Have not gotten in system programming of libreboot to work properly outside of ChromeOS as of yet. In case of a bad flash or build the system can easily be recovered with a SOIC8 adapter cable connected to a Raspberry Pi. This requires a near complete dissasembly of the system.

Libreboot is not required to use the mainline kernel and is an option only for those who wish to have a FOSS bios replacement. The Libreboot build is still only coreboot and does not offer any GRUB functionality, kernel partitions are still required, and it will still boot ChromeOS.

## Packages Required 
On Arch Linux these packages are:

* uboot-tools
* vboot-utils

### The Arch Linux Arm website provides information on how to configure the disk
The guide that Arch Linux Arm provides for the ASUS flip works for the ASUS C201PA Rockchip. [Chromebook Flip](https://archlinuxarm.org/platforms/armv7/rockchip/asus-chromebook-flip-c100p) install instructions are not only useful for setting up a basic system, but they are also great instructions for making a backup system on a USB drive that can be used to chroot and repair a broken system that is installed internally. This guide was originally made due to issues in their packaging of the kernel that prevented mainline from booting on the flip and has since been used to boot a Fedora rootfs on the flip.


### Configure ```sign_kernel_full.sh```
The script ```sign_kernel_full.sh``` is a convenience script that has four stages:

1. Make a kernel image based on the configuration file ```kernel.its```
2. Make a blank bootloader file
3. Pack the above two into a .kpart file (the kernel partition)
4. Write the .kpart file to the designated kernel partition

In the last line of ```sign_kernel_full.sh``` change `null` to the kernel partition, ex ```/dev/sda1```.

### Configure ```cmdline```
In this file are the arguments that will be passed to the kernel on boot, any extra kernel arguments should be added here. Modifications only need to be done to this file should the kernel be written to a different storage medium such as a micro sd card. Writing a kernel to an external medium makes for a good backup should a compiled or packaged kernel not function properly.

If writing the kernel partition to a differrent device or system, such as a micro sd card or desktop computer,```root=PARTUUID=%U/PARTNROFF=1``` in ```cmdline``` needs to be changed. 

Running ```blkid``` as root will show the PARTUUID for all disks connected to the system.

```
/dev/sde1: PARTLABEL="Kernel" PARTUUID="24557c83-0790-5d42-bfa6-18f85f56e048"
/dev/sde2: LABEL="_/" UUID="2161061e-8612-4e18-a4e1-0e95aca6d2ff" TYPE="ext4" PARTLABEL="Root" PARTUUID="1831c8a7-9fcb-e344-a56e-5425356afde5"
```

In this case ```root``` would be changed to ```root=PARTUUID=1831c8a7-9fcb-e344-a56e-5425356afde5```, since ```/dev/sde2``` is the partition containing the linux system to boot.

### Configure ```kernel.its```
Be sure that ```data = /incbin/("/boot/zImage");``` and ```data = /incbin/("/boot/dtbs/rk3288-veyron-speedy.dtb");``` both have the correct paths for the kernel image and dtb respectively and that the files exist.


### Run the Script
`sudo ./sign_kernel_full.sh`


# Index
### Adapted from atopuzovic's post on archlinuxarm.org
* sign_kernel_full.sh
* cmdline
* kernel.its
