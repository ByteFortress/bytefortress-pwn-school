#!/usr/bin/env bash
#
# build.sh
# Compiles a learner-written C source file with a chosen set of
# protection flags, so the effect of each flag is explicit rather
# than hidden in a Makefile. This script contains no vulnerability
# logic — it only controls compiler flags.
#
# Usage:
#   ./tools/build.sh <source.c> <output-binary> [protection-profile]
#
# Protection profiles:
#   none        -fno-stack-protector -z execstack -no-pie -z norelro
#   canary-only -fstack-protector-all -z execstack -no-pie -z norelro
#   nx-only     -fno-stack-protector -no-pie -z norelro
#   full        (no extra flags — modern default hardening)
#
# Default profile is "none" (all protections off), matching the early
# curriculum modules. Check each module's README.md for which profile
# it expects.

set -euo pipefail

if [[ $# -lt 2 || $# -gt 3 ]]; then
    echo "Usage: $0 <source.c> <output-binary> [none|canary-only|nx-only|full]"
    exit 1
fi

SRC="$1"
OUT="$2"
PROFILE="${3:-none}"

if [[ ! -f "$SRC" ]]; then
    echo "Error: source file '$SRC' not found."
    exit 1
fi

case "$PROFILE" in
    none)
        FLAGS=(-fno-stack-protector -z execstack -no-pie -z norelro)
        ;;
    canary-only)
        FLAGS=(-fstack-protector-all -z execstack -no-pie -z norelro)
        ;;
    nx-only)
        FLAGS=(-fno-stack-protector -no-pie -z norelro)
        ;;
    full)
        FLAGS=()
        ;;
    *)
        echo "Unknown profile: $PROFILE"
        echo "Valid profiles: none, canary-only, nx-only, full"
        exit 1
        ;;
esac

echo "Compiling $SRC -> $OUT"
echo "Profile: $PROFILE"
echo "Flags: ${FLAGS[*]:-<none, default hardening>}"
echo

gcc -g -o "$OUT" "$SRC" "${FLAGS[@]}"

echo "Build complete."
echo "Run tools/checksec.sh $OUT to confirm the protection state."
