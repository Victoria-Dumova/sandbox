#!/bin/sh

# Begin synchronized output
printf '\e[?2026h'

for i in `seq 1 10`; do
  printf "#$i: "
  printf '\e]8;;http://example.com\e\\Click to open example.com in browser\e]8;;\e\\\n'
done

# End synchronized output
printf '\e[?2026l'
