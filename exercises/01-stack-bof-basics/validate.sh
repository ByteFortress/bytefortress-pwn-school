#!/usr/bin/env bash
#
# validate.sh for module 01 — Stack Buffer Overflow — Basics
# Structural / protection-flag validation ONLY. This script does not
# contain, run, or perform any exploit. It checks that your build
# matches what this module's README.md expects.
#
# Usage: ./validate.sh <path-to-your-compiled-binary>

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <path-to-binary>"
    exit 1
fi

BINARY="$1"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

if [[ ! -f "$BINARY" ]]; then
    echo "Error: '$BINARY' not found. Build it first with tools/build.sh."
    exit 1
fi

echo "============================================================"
echo " Validating module 01: Stack Buffer Overflow — Basics"
echo " Expected protection profile: none"
echo "============================================================"

"$REPO_ROOT/tools/checksec.sh" "$BINARY"

echo
echo "------------------------------------------------------------"
echo "Manual checklist for this module (see README.md for detail):"
echo "  - Does the checksec output above match the 'none' profile"
echo "    this module expects?"
echo "  - Have you written NOTES.md documenting your findings?"
echo "  - Have you completed the paired external resource challenge"
echo "    listed in this module's README.md?"
echo "------------------------------------------------------------"
