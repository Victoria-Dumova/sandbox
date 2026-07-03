#!/bin/bash

# Frames for the animation
frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
messages=('Loading' 'Loading.' 'Loading..' 'Loading...')

i=0
while true; do
  frame="${frames[$((i % ${#frames[@]}))]}"
  msg="${messages[$((i % ${#messages[@]}))]}"

  # Set terminal tab title
  printf '\e]0;%s %s\a' "$frame" "$msg"

  # Print animation in the terminal body
  printf '\r\e[36m%s\e[0m %s   ' "$frame" "$msg"

  sleep 0.1
  ((i++))
done