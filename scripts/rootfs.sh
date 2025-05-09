#!/bin/bash

# Phase 1: Create Root Filesystem
# The purpose of this step is to set up the root filesystem structure according to the FHS (Filesystem Hierarchy Standard).

# Create essential directories
mkdir -p root/{boot,proc,sys,usr/{bin,sbin,lib,lib64},dev}
# In this step, we create the core directories such as /bin, /usr/bin, etc.,
# which will contain binaries and system programs.



# Create symbolic links for compatibility with traditional root filesystem layout
# These links ensure that binaries and libraries located in /usr are accessible from the root (/),
# which is important for systems that expect /bin, /lib, and /sbin to exist directly under /

# ⚠️ Note: Make sure you are inside the root filesystem directory before running these commands,
# for example: cd /home/user/mini_linux/root

ln -s usr/lib    lib     # Link /lib    -> /usr/lib
ln -s usr/lib64  lib64   # Link /lib64  -> /usr/lib64
ln -s usr/bin    bin     # Link /bin    -> /usr/bin
ln -s usr/sbin   sbin    # Link /sbin   -> /usr/sbin

# Export the path to the root filesystem for reuse in build scripts or other commands
export MINI="/home/uesr/mini_linux/root"

