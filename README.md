# Arch Linux Mainline Kernel on ASUS C201PA Rockchip

#### Libreboot download, for those who want it. [LINK](https://www.mirrorservice.org/sites/libreboot.org/release/stable/20160902/rom/depthcharge/)

## Packages Needed
* uboot-tools
* vboot-utils


### Configure ```sign_kernel_full.sh```
In the last line of ```sign_kernel_full.sh``` change `null` to the kernel partition.

### Configure ```cmdline```
If writing the kernel partition from a different host ```root=PARTUUID=%U/PARTNROFF=1``` in ```cmdline``` needs to be changed. 

Running ```blkid``` as root will show the PARTUUID for disks connected to the system.
```
/dev/sde1: PARTLABEL="Kernel" PARTUUID="24557c83-0790-5d42-bfa6-18f85f56e048"
/dev/sde2: LABEL="_/" UUID="2161061e-8612-4e18-a4e1-0e95aca6d2ff" TYPE="ext4" PARTLABEL="Root" PARTUUID="1831c8a7-9fcb-e344-a56e-5425356afde5"
```
The updated value for ```root``` in this case would be ```root=PARTUUID=1831c8a7-9fcb-e344-a56e-5425356afde5```, since ```/dev/sde2``` is the root partition.

### Configure ```kernel.its```
Be sure that ```data = /incbin/("/boot/zImage");``` and ```data = /incbin/("/boot/dtbs/rk3288-veyron-speedy.dtb");``` both have the correct paths for the kernel image and dtb respectively


### Run the Script
`sudo ./sign_kernel_full.sh`

# Index
### Adapted from atopuzovic's post on archlinuxarm.org
* sign_kernel_full.sh
* cmdline
* kernel.its
