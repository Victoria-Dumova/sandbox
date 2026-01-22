#!/bin/bash

# Array of ANSI color codes for rainbow effect
colors=(31 33 32 36 34 35)  # Red, Yellow, Green, Cyan, Blue, Magenta
# Some fun emojis
emojis=(🔥 🌈 🐢 🌟 🚀 🐸 😎 💥 🧠 🐱‍👤)

counter=1

while true; do
    # Pick a color based on counter
    color=${colors[$((counter % ${#colors[@]}))]}
    # Pick a random emoji
    emoji=${emojis[$RANDOM % ${#emojis[@]}]}

    # Print with color and emoji
    echo -e "\e[1;${color}m🌈 Count: $counter $emoji\e[0m"

    ((counter++))
    sleep 0.5
done
