#!/bin/bash
set -e

# Define your root filesystem path
MINI="/home/user/mini_linux/root"

# Clone Bash source code
git clone git://git.savannah.gnu.org/bash.git

# Create and move to build directory
mkdir -p bash-build
cd bash-build

# Configure Bash to install under /usr
../bash/configure --prefix=/usr

# Compile using 8 threads
make -j$(nproc)

# Install Bash to root filesystem
make DESTDIR="$MINI" install
cd ..

# Create symlink: /bin/sh -> bash
ln -sf bash "$MINI/bin/sh"

echo "✅ Bash built and installed successfully."
