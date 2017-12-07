#!/bin/bash

# Generate kernel files
echo "(Stage 1) Kernel files"
mkimage -D "-I dts -O dtb -p 2048" -f /kernel.its vmlinux.uimg

# Generate blank bootloader file
echo "(Stage 2) Bootloader file"
dd if=/dev/zero of=bootloader.bin bs=512 count=1

# Sign kernel and write to bootloader file
echo "(Stage 3) Sign Kernel to file"
vbutil_kernel \
    --pack vmlinux.kpart \
    --version 1 \
    --vmlinuz vmlinux.uimg \
    --arch arm \
    --keyblock /usr/share/vboot/devkeys/kernel.keyblock \
    --signprivate /usr/share/vboot/devkeys/kernel_data_key.vbprivk \
    --config cmdline \
    --bootloader bootloader.bin

# Write bootloader to disk, change null to partition.
echo "(Stage 4) Write bootloader to disk"
dd if=vmlinux.kpart of=/dev/null
