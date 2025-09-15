#!/bin/bash
set -euo pipefail

# Capture the gh subcommand to run each time (default: issue list)
if [ "$#" -eq 0 ]; then
  GH_CMD=("issue" "list")
else
  GH_CMD=("$@")
fi

# Always restore the normal buffer on exit
cleanup() {
  # Switch back to the normal screen buffer
  printf "\033[?1049l"
}
trap cleanup EXIT INT TERM

while :; do
  echo "This is the main buffer"
  sleep 1

  # Enter alternate screen and clear it
  printf "\033[?1049h\033[H\033[2J"
  echo "This is the alternate buffer — running: gh ${GH_CMD[*]}"
  echo

  # Run gh inside the alternate buffer.
  # Temporarily disable -e so a non-zero gh exit doesn't kill the loop.
  set +e
  gh "${GH_CMD[@]}"
  gh_status=$?
  set -e

  echo
  echo "gh exited with status $gh_status. Returning to the main buffer in 1s..."
  sleep 1

  # Return to normal screen
  printf "\033[?1049l"
  sleep 1
done
