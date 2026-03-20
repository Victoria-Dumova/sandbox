#!/bin/bash

frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
messages=('Loading' 'Loading.' 'Loading..' 'Loading...')

end=$((SECONDS + 5))
i=0
while [[ $SECONDS -lt $end ]]; do
  frame="${frames[$((i % ${#frames[@]}))]}"
  msg="${messages[$((i % ${#messages[@]}))]}"

  printf '\e]0;%s %s\a' "$frame" "$msg"
  printf '\r\e[36m%s\e[0m %s   ' "$frame" "$msg"

  sleep 0.1
  ((i++))
done

printf '\e]0;\a'       # clear the title
printf '\r\e[0m\e[K\n' # clear the line