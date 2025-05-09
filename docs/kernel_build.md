# Kernel Build Guide

This document describes the minimal configuration and build steps for compiling a tiny Linux kernel, intended for custom minimal systems and educational projects.

---

## 1. Clone the Linux Kernel


```bash
git clone --depth 1 https://github.com/torvalds/linux
cd linux
```
---

## 2.Configure the Kernel

Start with a minimal configuration:
```bash
make tinyconfig
make menuconfig
```
Enable the following options at minimum:

### General Setup
- [*] Enable support for printk
### 64-bit Support
- [*] 64-bit kernel

### Block Layer

   - [*] Enable the block layer

### Executable File Formats

  - [*] Kernel support for ELF binaries

  - [*] Kernel support for scripts starting with #!

### Device Drivers

  - [*] PCI support

### Generic Driver Options

  - [*] Maintain a devtmpfs filesystem to mount at /dev

  - [*] Automount devtmpfs at /dev, after the kernel mounted the rootfs

### SCSI Devices

  - [*] SCSI disk support (this unlocks after enabling SATA)

### SATA Drivers

  - [*] Intel ESB, ICH, PIIX3, PIIX4 PATA/SATA support

### Character Devices

  - [*] Enable TTY

  - [*] 8250/16550 and compatible serial support

  - [*] Console on 8250/16550 and compatible serial port

### File Systems

  - [*] The Extended 4 (ext4) filesystem

### Pseudo Filesystems

  - [*] /proc file system support

  - [*] sysfs file system support
---

## 3. Build the Kernel

```bash
make -j$(nproc)

```
---

## 4. Move the Kernel Image
```bash
mv arch/x86/boot/bzImage ../
cd ..
mv bzImage root/boot/

```



