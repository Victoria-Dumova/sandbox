#!/bin/bash

# Synchronized Output Mode Demo - Simplified and Reliable Version

# Synchronized output escape codes
SYNC_START=$'\033[?2026h'
SYNC_END=$'\033[?2026l'

# Colors using ANSI codes directly
RED=$'\033[31m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BLUE=$'\033[34m'
MAGENTA=$'\033[35m'
CYAN=$'\033[36m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

clear
echo "${BOLD}${CYAN}╔════════════════════════════════════════════╗${RESET}"
echo "${BOLD}${CYAN}║  Synchronized Output Mode Demo            ║${RESET}"
echo "${BOLD}${CYAN}╚════════════════════════════════════════════╝${RESET}"
echo ""

# Demo 1: Matrix-style falling text
echo "${GREEN}${BOLD}▶ Demo 1: Matrix Rain${RESET}"
echo "  Falling characters with synchronized updates..."
echo ""
sleep 1

# Get terminal size
COLS=$(tput cols)
ROWS=$(tput lines)

# Hide cursor
printf '\033[?25l'

# Clear screen
clear

# Simplified matrix rain - just a few columns for demonstration
for iteration in {1..30}; do
    # Enable synchronized output
    printf "%s" "$SYNC_START"

    # Draw 20 falling characters at random positions
    for col in {5..80..4}; do
        if [ $col -lt $COLS ]; then
            row=$((RANDOM % (ROWS - 2) + 1))
            printf '\033[%d;%dH%s%s%s' "$row" "$col" "$GREEN" "$((RANDOM % 2))" "$RESET"
        fi
    done

    # Disable synchronized output
    printf "%s" "$SYNC_END"

    sleep 0.1
done

# Show cursor and clear screen
printf '\033[?25h'
clear

echo ""
echo "${GREEN}${BOLD}✓ Demo 1 Complete${RESET}"
echo ""
sleep 1

# Demo 2: Animated counters
echo "${YELLOW}${BOLD}▶ Demo 2: Multiple Counters${RESET}"
echo "  20 counters updating simultaneously..."
echo ""
sleep 1

# Initialize display
printf "%s" "$SYNC_START"
clear
echo "${BOLD}Multiple Counter Demo:${RESET}"
echo "═══════════════════════"
echo ""
for i in {1..20}; do
    printf "Counter %2d: %5d\n" "$i" "0"
done
printf "%s" "$SYNC_END"

# Animate counters
for count in {1..50}; do
    printf "%s" "$SYNC_START"

    # Update each counter
    for i in {1..20}; do
        printf '\033[%d;13H' $((i + 3))
        printf "%s%5d%s" "$YELLOW" $((count * i % 1000)) "$RESET"
    done

    printf "%s" "$SYNC_END"
    sleep 0.05
done

echo ""
echo ""
echo "${YELLOW}${BOLD}✓ Demo 2 Complete${RESET}"
echo ""
sleep 1

# Demo 3: Progress bars
echo "${BLUE}${BOLD}▶ Demo 3: Progress Bars${RESET}"
echo "  5 simultaneous progress bars..."
echo ""
sleep 1

# Initialize progress bars
printf "%s" "$SYNC_START"
clear
echo "${BOLD}Progress Bar Demo:${RESET}"
echo "═══════════════════════"
echo ""
for i in {1..5}; do
    echo "Task $i: [                    ] 0%"
done
printf "%s" "$SYNC_END"

# Animate progress bars
for progress in {0..100..2}; do
    printf "%s" "$SYNC_START"

    for task in {1..5}; do
        # Each task progresses at slightly different rate
        task_progress=$((progress + (task - 3) * 5))
        if [ $task_progress -lt 0 ]; then task_progress=0; fi
        if [ $task_progress -gt 100 ]; then task_progress=100; fi

        filled=$((task_progress / 5))

        printf '\033[%d;9H' $((task + 3))
        printf "${CYAN}["
        for ((j=0; j<20; j++)); do
            if [ $j -lt $filled ]; then
                printf "█"
            else
                printf " "
            fi
        done
        printf "] %3d%%${RESET}" "$task_progress"
    done

    printf "%s" "$SYNC_END"
    sleep 0.03
done

echo ""
echo ""
echo "${BLUE}${BOLD}✓ Demo 3 Complete${RESET}"
echo ""
sleep 1

# Demo 4: Large data stream
echo "${MAGENTA}${BOLD}▶ Demo 4: Data Stream${RESET}"
echo "  Generating 500 lines with synchronized batching..."
echo ""
sleep 1

for batch in {1..5}; do
    printf "%s" "$SYNC_START"

    echo ""
    echo "${CYAN}${BOLD}═══ Batch $batch/5 ═══${RESET}"

    for i in {1..100}; do
        line_num=$(( (batch - 1) * 100 + i ))
        printf "${MAGENTA}Line %3d:${RESET} " "$line_num"
        printf "Data_%s_%d\n" "$(date +%H%M%S)" "$RANDOM"
    done

    printf "%s" "$SYNC_END"
    sleep 0.2
done

echo ""
echo "${MAGENTA}${BOLD}✓ Demo 4 Complete${RESET}"
echo ""
sleep 1

# Summary
clear
echo ""
echo "${BOLD}${GREEN}╔════════════════════════════════════════════╗${RESET}"
echo "${BOLD}${GREEN}║            🎉 Demo Complete! 🎉            ║${RESET}"
echo "${BOLD}${GREEN}╚════════════════════════════════════════════╝${RESET}"
echo ""
echo "${BOLD}What is Synchronized Output Mode?${RESET}"
echo "──────────────────────────────────────"
echo ""
echo "Synchronized output mode uses escape codes:"
echo "  ${YELLOW}• Start: \\033[?2026h${RESET}"
echo "  ${YELLOW}• End:   \\033[?2026l${RESET}"
echo ""
echo "This prevents flickering by buffering all output"
echo "between these codes and rendering it atomically."
echo ""
echo "${GREEN}Benefits:${RESET}"
echo "  ✓ No screen tearing"
echo "  ✓ Smooth animations"
echo "  ✓ Better performance"
echo "  ✓ Cleaner visual updates"
echo ""