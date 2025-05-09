# Mini Linux Kernel Project

## Overview

This project is a minimalistic custom Linux system built from scratch, intended for educational purposes to understand how the Linux kernel works and how user-space programs are initialized.

The goal is **not** to build a fully functional Linux distribution, but rather to explore and document the entire bootstrapping process from kernel to shell interaction.

---

## Objectives

- Build a **mini Linux kernel** with only the essential features.
- Setup a basic **root filesystem** manually.
- Compile and include **user-space tools** (bash, coreutils, etc.).
- Use **QEMU** for testing the system without risking the host environment.
- Gain a deep understanding of **init, libc, syscalls**, and low-level behavior.

---

## Requirements

Make sure to install the following packages:

```bash
sudo apt install \
bc binutils bison dwarves flex gcc git gnupg2 gzip \
libelf-dev libncurses5-dev libssl-dev make openssl \
pahole perl-base rsync tar xz-utils autoconf gperf \
autopoint texinfo texi2html gettext gawk bzip2 \
qemu-system-x86 libtool
