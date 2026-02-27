#!/usr/bin/env python3
"""Rotating Ooeeeaaa Cat - internet meme animation. Press Ctrl+C to exit."""

import time
import sys

HIDE   = '\033[?25l'
SHOW   = '\033[?25h'
RESET  = '\033[0m'
BOLD   = '\033[1m'

COLORS = ['\033[91m', '\033[93m', '\033[92m', '\033[96m', '\033[94m', '\033[95m']

W = 52  # display width

# 8 frames = full 360° spin
FRAMES = [
    # 0° — upright
    [
        r"     /\_/\     ",
        r"    ( o.o )    ",
        r"     > ^ <     ",
        r"    ~|   |~    ",
    ],
    # 45° — leaning right
    [
        r"        /\_/\  ",
        r"       (o. o) /",
        r"      _( ^ >-/ ",
        r"     /  ~ ~    ",
    ],
    # 90° — right side down
    [
        r"   /\/\/\/\_   ",
        r"  ( >.>      ) ",
        r"   \______/^/  ",
        r"   ~~ ~~ ~~    ",
    ],
    # 135° — past sideways
    [
        r"  \    ~  \    ",
        r"   \(o. o) \   ",
        r"    \  ^ <>-\  ",
        r"     \/\_/\    ",
    ],
    # 180° — upside down
    [
        r"    ~|   |~    ",
        r"     > v <     ",
        r"    ( o.o )    ",
        r"     \/  /\    ",
    ],
    # 225° — past upside down
    [
        r"    /\_/\/     ",
        r"   / <>^  )    ",
        r"  / (o. o)/    ",
        r"     ~ ~  \    ",
    ],
    # 270° — left side down
    [
        r"    _/\_/\/\/\ ",
        r" (      <.<  ) ",
        r"  \^\_______/  ",
        r"    ~~ ~~ ~~   ",
    ],
    # 315° — almost back
    [
        r"    /\_/\      ",
        r"   /(o. o)     ",
        r"  /-< ^  )_    ",
        r"      ~ ~  \   ",
    ],
]

SOUNDS = [
    list("  o  o  e  e  e  a  a  a  "),
    list("  O  O  E  E  E  A  A  A  "),
    list("  oO eE aA oO eE aA !!!!  "),
    list("  OOEEEAAA~~OOEEEAAA~~~~~  "),
    list("  oo ee aa oo ee aa !!!!!!  "),
]

def rainbow(chars, offset):
    return ''.join(COLORS[(i + offset) % len(COLORS)] + c for i, c in enumerate(chars)) + RESET

FRAME_LINES = 9  # total lines printed per frame (blank + 4 cat + blank + sound + blank + hint)

def render(tick):
    fi    = tick % len(FRAMES)
    color = COLORS[fi % len(COLORS)]
    sound = SOUNDS[(tick // len(FRAMES)) % len(SOUNDS)]

    out = ['']
    for line in FRAMES[fi]:
        out.append(f"{BOLD}{color}{line.center(W)}{RESET}")
    out.append('')
    out.append(rainbow(list(''.join(sound).center(W)), tick * 3))
    out.append('')
    out.append(f"\033[90m{'( Ctrl+C to exit )'.center(W)}{RESET}")

    # On first frame print normally; afterwards move cursor back up to overwrite in place
    prefix = f'\033[{FRAME_LINES - 1}A\r' if tick > 0 else ''
    return prefix + '\n'.join(out)

def main():
    sys.stdout.write(HIDE)
    sys.stdout.flush()
    try:
        tick = 0
        while True:
            sys.stdout.write(render(tick))
            sys.stdout.flush()
            time.sleep(0.13)
            tick += 1
    except KeyboardInterrupt:
        pass
    finally:
        sys.stdout.write(SHOW + RESET + '\n')
        print("ooeeeaaa~ (bye!)")

if __name__ == '__main__':
    main()
