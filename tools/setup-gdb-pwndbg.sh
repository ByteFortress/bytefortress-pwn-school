#!/usr/bin/env bash
#
# setup-gdb-pwndbg.sh
# Sets up GDB with pwndbg (a GDB plugin that adds exploit-development
# conveniences: better register/stack display, heap inspection, etc.)
# This is standard, widely-used, defensively-oriented tooling — not
# exploit code. Intended for Debian/Ubuntu/Kali-based systems.

set -euo pipefail

echo "============================================================"
echo " Byte Fortress Learn — GDB + pwndbg setup"
echo "============================================================"

if ! command -v gdb >/dev/null 2>&1; then
    echo "Installing gdb..."
    sudo apt update
    sudo apt install -y gdb git
else
    echo "gdb already installed: $(gdb --version | head -n1)"
fi

PWNDBG_DIR="$HOME/pwndbg"

if [[ -d "$PWNDBG_DIR" ]]; then
    echo "pwndbg already cloned at $PWNDBG_DIR, pulling latest..."
    git -C "$PWNDBG_DIR" pull
else
    echo "Cloning pwndbg into $PWNDBG_DIR..."
    git clone https://github.com/pwndbg/pwndbg "$PWNDBG_DIR"
fi

echo "Running pwndbg installer..."
cd "$PWNDBG_DIR"
./setup.sh

echo
echo "============================================================"
echo "Setup complete."
echo "Launch any binary with: gdb ./your-binary"
echo "pwndbg should load automatically and print its banner."
echo
echo "Useful pwndbg commands to know before starting the exercises:"
echo "  context       - show registers, stack, disassembly at once"
echo "  cyclic <n>    - generate a De Bruijn pattern of length n"
echo "                  (for finding offsets, not for building exploits)"
echo "  cyclic -l <v> - find the offset of a crash value in that pattern"
echo "  checksec      - pwndbg also has its own checksec command"
echo "============================================================"
