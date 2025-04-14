#!/bin/zsh

# Define an array of emoji
emojis=("😀" "😂" "😎" "🥳" "😡" "😱" "👀" "🤖" "🔥" "🌈" "🎉" "💀" "🦄" "🐱" "🐶" "🍕" "🌮" "🚀" "🎮" "🎵")

# Infinite loop to print random emoji
while true; do
  random_index=$(( RANDOM % ${#emojis[@]} ))
  echo -n "${emojis[$random_index]} \n"
  sleep 0.5  # adjust speed here
done
