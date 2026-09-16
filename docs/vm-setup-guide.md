# VM & Toolchain Setup Guide

Do all of this work inside an isolated virtual machine, never on your
host machine or any shared/production system. You'll be deliberately
disabling security protections; that VM should never be exposed to a
network you don't control.

## 1. Choose your VM

- **Recommended:** Ubuntu 22.04 LTS (Server or Desktop) or Kali Linux,
  running in VirtualBox, VMware, or UTM (Apple Silicon).
- Give it at least 2 CPU cores, 4 GB RAM, 20 GB disk.
- **Set the network adapter to Host-Only or NAT with no port
  forwarding.** You do not need internet-facing access for this VM
  during exercises, only for initial package installation.
- Take a clean snapshot right after setup, before you start any
  exercise. Corrupting a VM's state with a bad exploit attempt is
  normal and expected; snapshots make recovery instant.

## 2. Install the toolchain

```bash
sudo apt update
sudo apt install -y build-essential gdb git python3 python3-pip \
    binutils elfutils file
```

### checksec

```bash
sudo apt install -y checksec
# If not packaged on your distro:
git clone https://github.com/slimm609/checksec.sh
sudo cp checksec.sh/checksec /usr/local/bin/checksec
```

### pwntools (used by the external resource modules, e.g. ROP
Emporium and SEED Labs solutions you'll write against those
platforms — not required for building your own `template.c`)

```bash
pip3 install --user pwntools
```

### pwndbg

Run the provided script:

```bash
./tools/setup-gdb-pwndbg.sh
```

## 3. Disable ASLR system-wide for early modules

Several early modules ask you to disable ASLR temporarily so offsets
are deterministic while you're learning the mechanics. Later modules
re-enable it deliberately.

```bash
# Disable (temporary, resets on reboot)
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space

# Re-enable
echo 2 | sudo tee /proc/sys/kernel/randomize_va_space
```

Each module's README tells you which state it expects.

## 4. Verify your setup

```bash
gcc --version
gdb --version
checksec --version
python3 -c "import pwn; print(pwn.__version__)"
```

If all four print a version without error, you're ready.

## 5. Accept the disclaimer

```bash
./tools/accept-disclaimer.sh
```

Then move to `docs/curriculum-map.md` and start with module 01.
