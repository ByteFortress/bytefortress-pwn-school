#!/usr/bin/env bash
#
# accept-disclaimer.sh
# Local, honor-system acceptance gate for DISCLAIMER.md.
# Logs a timestamped acceptance record to .disclaimer-accepted in the
# repo root. This does NOT technically enforce anything — it exists to
# make sure the learner has actually read the terms before proceeding,
# and to create a local record that they did.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DISCLAIMER_FILE="$REPO_ROOT/DISCLAIMER.md"
LOG_FILE="$REPO_ROOT/.disclaimer-accepted"
CONFIRM_PHRASE="I ACCEPT"

if [[ ! -f "$DISCLAIMER_FILE" ]]; then
    echo "Error: DISCLAIMER.md not found at $DISCLAIMER_FILE"
    exit 1
fi

echo "============================================================"
echo " Byte Fortress Learn — Binary Exploitation Fundamentals"
echo "============================================================"
echo
cat "$DISCLAIMER_FILE"
echo
echo "============================================================"
echo "To proceed you must confirm you have read and agree to the"
echo "terms above, including using this material only on systems"
echo "you own or are explicitly authorized to test."
echo
read -rp "Type exactly '${CONFIRM_PHRASE}' to continue: " USER_INPUT

if [[ "$USER_INPUT" != "$CONFIRM_PHRASE" ]]; then
    echo
    echo "Confirmation phrase did not match. Exiting without recording acceptance."
    exit 1
fi

TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
{
    echo "Accepted at: $TIMESTAMP"
    echo "Confirmed by typed phrase: $CONFIRM_PHRASE"
    echo "User (whoami): $(whoami)"
    echo "Host: $(hostname 2>/dev/null || echo unknown)"
} >> "$LOG_FILE"

echo
echo "Acceptance recorded in $LOG_FILE."
echo "You may now proceed to docs/vm-setup-guide.md and docs/curriculum-map.md."
