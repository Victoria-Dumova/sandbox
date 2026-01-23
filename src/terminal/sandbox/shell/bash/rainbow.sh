#!/bin/bash

# Array of ANSI color codes for rainbow effect
colors=(31 33 32 36 34 35)
emojis=(🔥 🌈 🐢 🌟 🚀 🐸 😎 💥 🧠 🐱‍👤)

counter=1

while true; do
    color=${colors[$((counter % ${#colors[@]}))]}
    emoji=${emojis[$RANDOM % ${#emojis[@]}]}

    printf "\e[1;%sm🌈 Count: %d %s\e[0m\n" "$color" "$counter" "$emoji"

    ((counter++))
    sleep 0.5
done

