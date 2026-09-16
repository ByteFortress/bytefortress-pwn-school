#!/usr/bin/env bash
#
# checksec.sh
# Thin wrapper around the standard `checksec` tool (or a manual
# fallback using readelf/file if checksec isn't installed) that
# explains what each protection flag means for the exercise you're
# working on. This is a diagnostic tool — it does not exploit anything.
#
# Usage: ./tools/checksec.sh <path-to-binary>

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <path-to-binary>"
    exit 1
fi

BINARY="$1"

if [[ ! -f "$BINARY" ]]; then
    echo "Error: '$BINARY' not found."
    exit 1
fi

echo "============================================================"
echo " Protection check: $BINARY"
echo "============================================================"

if command -v checksec >/dev/null 2>&1; then
    checksec --file="$BINARY"
else
    echo "(checksec not found — falling back to manual checks via readelf/file)"
    echo
    echo "-- Canary --"
    if readelf -s "$BINARY" 2>/dev/null | grep -q __stack_chk_fail; then
        echo "Canary found: YES (stack protector is enabled)"
    else
        echo "Canary found: NO (stack protector likely disabled)"
    fi

    echo
    echo "-- NX (No-Execute stack) --"
    if readelf -l "$BINARY" 2>/dev/null | grep -A1 "GNU_STACK" | grep -q "RWE"; then
        echo "NX: DISABLED (stack is executable)"
    else
        echo "NX: ENABLED (stack is not executable)"
    fi

    echo
    echo "-- PIE (Position Independent Executable, works with ASLR) --"
    if file "$BINARY" | grep -qi "pie executable\|shared object"; then
        echo "PIE: ENABLED"
    else
        echo "PIE: DISABLED"
    fi

    echo
    echo "-- RELRO --"
    if readelf -l "$BINARY" 2>/dev/null | grep -q "GNU_RELRO"; then
        if readelf -d "$BINARY" 2>/dev/null | grep -q "BIND_NOW"; then
            echo "RELRO: FULL"
        else
            echo "RELRO: PARTIAL"
        fi
    else
        echo "RELRO: NONE"
    fi
fi

cat <<'EOF'

------------------------------------------------------------
What these mean for your exercise:

  Canary   - detects stack buffer overflows that overwrite the
             return address before the function returns. Disabled
             with `-fno-stack-protector` at compile time.
  NX       - marks the stack (and other data segments) as
             non-executable, so injected shellcode on the stack
             can't be run directly. Disabled with `-z execstack`.
  PIE      - randomizes the base address of the binary itself each
             run (works together with ASLR). Disabled with `-no-pie`.
  RELRO    - controls whether the GOT (Global Offset Table) is
             writable after startup, relevant to GOT-overwrite
             techniques. Set to none with `-z norelro`.

Match these flags to what your current module's README asks you to
disable, and confirm the result here before moving on to the guided
exploitation practice on the external resource it links to.
------------------------------------------------------------
EOF
