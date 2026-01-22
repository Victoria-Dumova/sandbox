#!/bin/bash

# Simple color test
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

echo "${RED}This text should be RED${RESET}"
echo "${GREEN}This text should be GREEN${RESET}"
echo "${YELLOW}This text should be YELLOW${RESET}"
echo "${CYAN}This text should be CYAN${RESET}"
echo "This text should be normal"