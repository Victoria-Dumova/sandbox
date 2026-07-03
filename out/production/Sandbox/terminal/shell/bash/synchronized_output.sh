#!/bin/bash

# Synchronized Output Mode Demo
# This script demonstrates the difference between synchronized and non-synchronized output

# ANSI escape codes (using $'...' syntax for proper interpretation)
SYNC_START=$'\033[?2026h'  # Enable synchronized output
SYNC_END=$'\033[?2026l'    # Disable synchronized output
CLEAR_SCREEN=$'\033[2J'
CURSOR_HOME=$'\033[H'
SAVE_CURSOR=$'\033[s'
RESTORE_CURSOR=$'\033[u'

# Colors
RED=$'\033[31m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BLUE=$'\033[34m'
MAGENTA=$'\033[35m'
CYAN=$'\033[36m'
RESET=$'\033[0m'

printf "${CYAN}=== Synchronized Output Mode Demo ===${RESET}\n\n"

# Demo 1: Matrix-style falling characters with synchronized output
printf "${GREEN}Demo 1: Matrix Rain (with synchronized output)${RESET}\n"
echo "Press Ctrl+C to stop..."
sleep 2

# Clear screen and hide cursor
printf "\033[2J\033[H\033[?25l"

cols=$(tput cols)
rows=$(tput lines)

# Initialize column positions
declare -a positions
for ((i=0; i<cols; i++)); do
    positions[$i]=$((RANDOM % rows))
done

# Run for 5 seconds
end_time=$((SECONDS + 5))
while [ $SECONDS -lt $end_time ]; do
    # Enable synchronized output
    printf "${SYNC_START}"

    # Generate lots of output
    for ((i=0; i<cols; i+=2)); do
        row=${positions[$i]}

        # Move cursor and print character
        printf "\033[${row};${i}H"

        # Random character (0, 1, or Japanese character)
        case $((RANDOM % 3)) in
            0) printf "${GREEN}0${RESET}" ;;
            1) printf "${GREEN}1${RESET}" ;;
            2) printf "${GREEN}$(printf '\u30%02x' $((RANDOM % 128)))${RESET}" ;;
        esac

        # Update position
        positions[$i]=$(( (row + 1) % rows ))

        # Fade out trail
        if [ $row -gt 3 ]; then
            printf "\033[$((row-3));${i}H "
        fi
    done

    # Disable synchronized output - all updates render at once
    printf "${SYNC_END}"

    sleep 0.03
done

# Clear screen and show cursor
printf "\033[2J\033[H\033[?25h\n"

printf "\n${GREEN}Demo 2: Rapid Counter Updates${RESET}\n"
echo "Counting with synchronized output..."
sleep 1

# Demo 2: Multiple counters updating simultaneously
printf "${SYNC_START}"
printf "\033[2J\033[H"
echo "Multiple Counters (Synchronized Updates):"
echo "========================================="
echo ""
for i in {1..20}; do
    echo "Counter $i: 0"
done
printf "${SYNC_END}"

for count in {1..100}; do
    printf "${SYNC_START}"

    # Update all counters
    for i in {1..20}; do
        printf "\033[$((i+3));12H${YELLOW}$((count * i % 1000))${RESET}    "
    done

    printf "${SYNC_END}"
    sleep 0.02
done

printf "\n\n${GREEN}Demo 3: ASCII Art Animation${RESET}\n"
sleep 1

# Demo 3: Animated ASCII art
frames=(
    "   O\n  /|\\\\\n  / \\\\"
    "  \\\\O/\n   |\n  / \\\\"
    "   O\n  /|\\\\\n  / \\\\"
    "  /O\\\\\n   |\n  / \\\\"
)

printf "\033[2J\033[H"
echo "Animated Stick Figure:"
echo "====================="

for iteration in {1..20}; do
    for frame in "${frames[@]}"; do
        printf "${SYNC_START}"
        printf "\033[4;1H"
        printf "$frame\n"
        printf "${SYNC_END}"
        sleep 0.1
    done
done

# Demo 4: Massive data dump with synchronized output
#printf "\n${GREEN}Demo 4: Large Data Stream${RESET}\n"
#echo "Generating 1000 lines of data with synchronized updates..."
#sleep 1
#
#for batch in {1..10}; do
#    printf "${SYNC_START}"
#
#    printf "\n${CYAN}=== Batch $batch ===${RESET}\n"
#    for i in {1..100}; do
#        line_num=$(( (batch - 1) * 100 + i ))
#        printf "${MAGENTA}Line $line_num:${RESET} $(date +%H:%M:%S.%N) - Random data: $(openssl rand -hex 16 2>/dev/null || echo "data_$(uuidgen 2>/dev/null || echo $RANDOM$RANDOM$RANDOM)")\n"
#    done
#
#    printf "${SYNC_END}"
#    sleep 0.2
#done

# Show cursor and finish
#printf "\033[?25h"
#printf "\n${CYAN}=== Demo Complete ===${RESET}\n"
#printf "Synchronized output mode prevents flickering by buffering\n"
#printf "all output between ${YELLOW}\\033[?2026h${RESET} and ${YELLOW}\\033[?2026l${RESET} escape codes.\n"

# Demo 5: Delete 1000 lines from the output
#sleep 1
#printf "\n${RED}Demo 5: Deleting 1000 lines from output${RESET}\n"
#echo "Deleting 1000 lines in 3 seconds..."
#sleep 3

# Move cursor up 1000 lines and clear everything from that point down
#printf "\033[1000A\033[J"
#printf "${GREEN}1000 lines deleted!${RESET}\n"
