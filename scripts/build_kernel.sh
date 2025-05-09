!/bin/bash

# This script automates the minimal build process of the Linux kernel for a tiny system.

set -e

echo "[+] Cloning the Linux kernel..."
git clone --depth 1 https://github.com/torvalds/linux
cd ../linux

echo "[+] Applying tiny configuration..."
make tinyconfig

echo "[*] Launching menuconfig for manual selection..."
make menuconfig

echo "[+] Compiling kernel..."
make -j$(nproc)

echo "[+] Moving bzImage to project root..."
mv arch/x86/boot/bzImage ../
cd ..

echo "[+] Moving bzImage to root/boot/"
mv bzImage root/boot/

echo "[✓] Kernel build complete!"
