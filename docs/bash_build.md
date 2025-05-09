# Building and Installing GNU Bash for the Mini Linux Project

This guide explains how to clone, build, and install the GNU Bash shell into your minimal Linux environment.

## Prerequisites

Make sure the following tools are installed:

- `git`
- `gcc`
- `make`

## Steps

### 1. Clone the Bash Source Code

We use the official GNU Savannah repository:



```bash
git clone git://git.savannah.gnu.org/bash.git
```

### 2. Create a Separate Build Directory

This helps keep the source clean:

```bash
mkdir bash-build
cd bash-build
```

### 3. Explore Configuration Options (Optional)
```bash
../bash/configure --help
```

### 4. Configure the Build

We install Bash to /usr inside our root filesystem later:

```bash
../bash/configure --prefix=/usr
```

### 5. Compile
```bash
make -j$(nproc)
```
### 6. Install into Root Filesystem

Assuming $MINI points to your root directory (e.g., /home/user/mini_linux/root):

```bash
make DESTDIR=$MINI install
```
### 7. Set /bin/sh as a Symlink to Bash

```bash
ln -s bash root/bin/sh
```
Now your system has a basic shell installed.


