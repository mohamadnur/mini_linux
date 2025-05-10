# 🧰 Building Coreutils for `mini_linux`
This guide describes the process of building **GNU Coreutils** from source as part of a minimal Linux system.

## 🔎 What is Coreutils and Why is it Important?

GNU Coreutils is a collection of basic file, shell, and text manipulation utilities. These are foundational tools that nearly every Unix-like system depends on. They include essential commands like:

-    `ls`, `cp`, `mv`, `rm` — for file management

-    `cat`, `head`, `tail`, `wc` — for viewing and processing text

-    `chmod`, `chown`, `stat` — for inspecting and managing file permissions

-    `date`, `sleep`, `uptime`, `whoami` — for system information and scripting and many more...



Without Coreutils, a Linux environment is practically unusable for basic interaction, automation, or scripting.

In your `mini_linux` system, building these from source ensures:

-    Full control over included features

-    Compatibility with your custom glibc and toolchain

-    Avoiding unnecessary system dependencies like `SELinux` or `libcap`

## 📦 1. Clone the repository
We use a shallow clone for faster download:

```bash
git clone --depth 1 https://github.com/coreutils/coreutils
```

## 🧱 2. Prepare the build directory

```bash
mkdir coreutils-build
```
## 🔧 3. Bootstrap the source

Navigate to the source folder and run the bootstrap script to prepare the build system:

```bash
cd coreutils
./bootstrap
cd ..
```
## ⚠️ Common error during bootstrap:

```bash
fatal: Unable to find current revision in submodule path 'gnulib'
```
**Cause**: The `gnulib` submodule is missing or corrupt.

**Fix**:

```bash
rm -rf gnulib .git/modules/gnulib
git submodule update --init --recursive
```

If the issue persists or is slow (common with gnulib):

```bash
git config submodule.gnulib.url https://github.com/coreutils/gnulib.git
git submodule sync
git submodule update --init --recursive
```

## ⚙️ 4. Configure the build

```bash
cd coreutils-build
../coreutils/configure --without-selinux --disable-libcap --prefix=/usr
```
Explanation:

-    `--without-selinux`: Avoid linking against SELinux (not needed in minimal systems).

-    `--disable-libcap`: Avoid using Linux capabilities library.

-    `--prefix=/usr`: Install utilities in `/usr/bin`, matching standard Linux layouts.


## 🛠️ 5. Build and install

```bash
make -j$(nproc)
make DESTDIR=$MINI install
cd ..
```

🔍 `$MINI` should point to your mini Linux root path (e.g. `/home/user/mini_linux/root`).

## 🗂️ 6. Verify the result

```bash
ls $MINI/usr/bin
```

You should now see basic utilities like `ls`, `cp`, `mv`, `rm`, `cat`, etc., installed.

## 📝 Notes

-    If you're using a **release tarball** instead of a git clone, `./bootstrap` is **not** needed.

-    Do **not** push large submodules like `gnulib` to your Git repository. Instead, document the steps to fetch it, as shown above
