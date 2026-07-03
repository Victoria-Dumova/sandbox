#!/bin/bash

# Print static top line
echo "Main operation status (press Ctrl+C to stop):"

# Loop to show and hide a dynamic second line
while true; do
    # Show inlay line
    echo "  → Status: pupupu..."
    sleep 1

    # Move cursor up and clear line
    echo -ne "\033[1A\033[2K"
    sleep 1
done
