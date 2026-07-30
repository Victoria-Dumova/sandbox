
#!/bin/bash

# Spinner characters
spin='-\|/'

# Loop forever
while true; do
  for i in $(seq 0 3); do
    printf "\r%s" "${spin:$i:1}"
    sleep 0.1
  done
done
