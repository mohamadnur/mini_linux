# Documentation: Building GCC Manually on CentOS Stream 9 Without Replacing the System Version

This guide walks through **cloning, configuring, building, and installing GCC** from source on **CentOS Stream 9** without overwriting the system’s built-in version.

---

## 🛠 Why Build a Custom GCC Version?

The default GCC version in CentOS Stream 9 is 11.5, which does not meet the minimum requirement (GCC ≥ 12) for building the latest GNU C Library (glibc). Attempting to compile glibc with an older version leads to build failures.

Since glibc is a critical component in my custom Linux system project, I built GCC from source to meet the necessary requirements and gain full control over the build process

---

## ✅ Benefits:

-   Satisfies glibc’s minimum requirement (GCC ≥ 12).

-   Provides access to modern compiler features and optimizations.

-   Isolates the toolchain in $HOME/.local/gcc-16.0 to avoid system conflicts.

-   Preserves system stability by keeping the default compiler untouched.

-   Enables clean and reproducible builds in a controlled user-space environment.


---

## 🛠 Requirements

### Install necessary development tools:

```bash
sudo dnf groupinstall "Development Tools"
sudo dnf install gcc gcc-c++ git wget tar \
    glibc-devel glibc-devel.i686 \
    libstdc++-devel libstdc++-devel.i686 \
    gmp-devel mpfr-devel libmpc-devel isl-devel \
    zlib-devel
```

---

## 📥 Clone GCC Source Code

```bash
git clone git://gcc.gnu.org/git/gcc.git gcc-src
cd gcc-src
./contrib/download_prerequisites
cd ..
```

---

## 📁 Create Build Directory (must be separate from source tree)

```bash
mkdir gcc-build
cd gcc-build
```

---

## ⚙️ Configure GCC Build

```bash
../gcc-src/configure \
  --prefix=$HOME/.local/gcc-16.0 \
  --enable-languages=c,c++ \
  --disable-multilib \
  --program-suffix=-16.0 \
  --enable-checking=release \
  --enable-threads=posix \
  --enable-shared \
  --enable-__cxa_atexit \
  --with-system-zlib
```

### Explanation of Options:

* `--prefix`: Target installation directory.
* `--disable-multilib`: Avoids 32-bit support complications.
* `--program-suffix`: Adds suffix to GCC binaries (e.g. `gcc-16.0`).

---

## 🧱 Build GCC
**Important: Never run `make` inside the source directory.**

```bash
make -j$(nproc)
```
The make step takes a long time . if your build fails and your configure command has lots of complicated options you should try removing options and keep it simple. Do not add lots of configure options you don't understand, they might be the reason your build fails. 

---

## 📦 Install GCC

```bash
make install
```

Installed to: `$HOME/.local/gcc-16.0`

---

## 🔧 Set Up Environment Variables

Add the following to your `~/.bashrc.d/gcc.sh` (or directly into `~/.bashrc`):

```bash
export PATH="$HOME/.local/gcc-16.0/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/gcc-16.0/lib64"

export CC="$HOME/.local/gcc-16.0/bin/gcc-16.0"
export CXX="$HOME/.local/gcc-16.0/bin/g++-16.0"

```

Activate the environment:

```bash
source ~/.bashrc
```

---

## ✅ Verify Installation

```bash
gcc-16.0 --version
g++-16.0 --version
```

---

## 📁 Directory Structure Used

```
~/
├── gcc-src         # Source code
├── gcc-build       # External build directory
└── .local/gcc-16.0 # Final installation path
```

---

## 🧠 Final Notes:

* Use `gcc-16.0` explicitly in your projects to avoid confusion.
* You can set up CMake or Meson to target this GCC version using environment variables or a toolchain file.
* This custom installation has no effect on `dnf`, `rpm`, or any system-level tools.

---


