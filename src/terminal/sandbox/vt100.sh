#!/bin/sh

# position cursor at the bottom of the screen
# to ensure the text is printed at the bottom
printf "\x1b[$(tput lines);1H"

# print three lines
printf "first line\n"
printf "second line\n"
printf "third line"

# move cursor up
printf "\x1b[A"

# move cursor to the beginning of the line
printf "\r"

# clear the screen from the cursor position to end of screen
printf "\x1b[0J"

# give a couple of new lines of not overwrite the last line by prompt
printf "\n\n"