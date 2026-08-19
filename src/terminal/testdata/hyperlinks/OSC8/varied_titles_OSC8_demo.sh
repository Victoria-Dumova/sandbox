#!/bin/sh
# OSC8 hyperlink demo: the same kinds of links with a wide variety of TITLES
# (the clickable visible text), to check how a terminal renders and hit-tests them.
#
# Format: ESC ] 8 ; params ; URI ESC \   <title>   ESC ] 8 ; ; ESC \

link() { # link <uri> <title>
  printf '\033]8;;%s\033\\%s\033]8;;\033\\' "$1" "$2"
}

row() { # row <label> <uri> <title>
  printf '%-28s ' "$1"
  link "$2" "$3"
  printf '\n'
}

printf '\n\033[1m== Plain titles ==\033[0m\n'
row "short"            "https://example.com"            "click me"
row "single char"      "https://example.com"            "x"
row "sentence"         "https://example.com"            "Click to open example.com in the browser"
row "url as title"     "https://example.com/path?q=1"   "https://example.com/path?q=1"
row "with spaces"      "https://example.com"            "   padded   title   "
row "punctuation"      "https://example.com"            "[Open] (docs) - #42, v1.2.3!"

printf '\n\033[1m== Styled titles ==\033[0m\n'
printf '%-28s ' "bold"      ; printf '\033[1m'  ; link "https://example.com" "Bold link"      ; printf '\033[0m\n'
printf '%-28s ' "underline" ; printf '\033[4m'  ; link "https://example.com" "Underlined link"; printf '\033[0m\n'
printf '%-28s ' "italic"    ; printf '\033[3m'  ; link "https://example.com" "Italic link"    ; printf '\033[0m\n'
printf '%-28s ' "blue fg"   ; printf '\033[34m' ; link "https://example.com" "Blue link"      ; printf '\033[0m\n'
printf '%-28s ' "256-color" ; printf '\033[38;5;205m'; link "https://example.com" "Pink link" ; printf '\033[0m\n'
printf '%-28s ' "truecolor" ; printf '\033[38;2;0;200;120m'; link "https://example.com" "RGB link"; printf '\033[0m\n'
printf '%-28s ' "on bg"     ; printf '\033[43;30m'; link "https://example.com" "Link on yellow"; printf '\033[0m\n'
printf '%-28s ' "reversed"  ; printf '\033[7m'  ; link "https://example.com" "Reversed link"  ; printf '\033[0m\n'
printf '%-28s ' "strikethrough"; printf '\033[9m'; link "https://example.com" "Struck link"   ; printf '\033[0m\n'
printf '%-28s ' "color mid-title" ; printf '\033]8;;https://example.com\033\\'
printf 'half \033[31mred\033[0m half plain'; printf '\033]8;;\033\\\n'

printf '\n\033[1m== Unicode / wide / RTL titles ==\033[0m\n'
row "emoji"            "https://example.com"            "🔗 Open link 🚀"
row "korean"           "https://example.com"            "한국어 링크를 클릭하세요"
row "chinese"          "https://example.com"            "点击打开链接"
row "japanese"         "https://example.com"            "リンクをクリック"
row "arabic (RTL)"     "https://example.com"            "انقر لفتح الرابط"
row "hebrew (RTL)"     "https://example.com"            "לחץ לפתיחת הקישור"
row "combining marks"  "https://example.com"            "Café naïve résumé ẛ̣"
row "box drawing"      "https://example.com"            "┌── link ──┐"
row "zwj emoji"        "https://example.com"            "👩‍💻 developer link"

printf '\n\033[1m== Different URI schemes ==\033[0m\n'
row "https"            "https://example.com"                       "https link"
row "http"             "http://example.com"                        "http link"
row "file (dir)"       "file://$(hostname)$(pwd)"                  "file:// this directory"
row "file (this file)" "file://$(hostname)$PWD/varied_titles_OSC8_demo.sh" "file:// this script"
row "mailto"           "mailto:someone@example.com"                "mailto: send an email"
row "ftp"              "ftp://ftp.example.com/pub"                 "ftp link"
row "ssh"              "ssh://user@example.com:22"                 "ssh link"
row "vscode"           "vscode://file/tmp/x.txt:10:5"              "editor deep link"
row "idea"             "idea://open?file=/tmp/x.txt&line=10"       "IDEA deep link"
row "fragment"         "https://example.com/docs#section-3"        "link to #section-3"
row "query + encoded"  "https://example.com/s?q=hello%20world&n=1" "encoded query link"
row "port"             "http://localhost:8080/health"              "localhost:8080 link"
row "unicode host"     "https://xn--bcher-kva.example"             "IDN (punycode) link"

printf '\n\033[1m== Multi-line and adjacent titles ==\033[0m\n'
printf 'three adjacent, no gap:  '
link "https://example.com/1" "ONE"; link "https://example.com/2" "TWO"; link "https://example.com/3" "THREE"
printf '\n'
printf 'adjacent, space between: '
link "https://example.com/1" "ONE"; printf ' '; link "https://example.com/2" "TWO"; printf ' '
link "https://example.com/3" "THREE"; printf '\n'
printf 'same URI, id=grp (one hover): '
printf '\033]8;id=grp;https://example.com\033\\part A\033]8;;\033\\ ... '
printf '\033]8;id=grp;https://example.com\033\\part B\033]8;;\033\\\n'
printf 'title spanning a newline:\n'
printf '\033]8;;https://example.com\033\\line one of the title\nline two of the title\033]8;;\033\\\n'
printf 'long title that should wrap: '
link "https://example.com" "$(printf 'wrap-me-%.0s' 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)"
printf '\n'
printf 'inside a box:            \n'
printf '  \342\224\214\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\220\n'
printf '  \342\224\202 '; link "https://example.com" "boxed link"; printf ' \342\224\202\n'
printf '  \342\224\224\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\200\342\224\230\n'

printf '\n\033[1m== Edge cases ==\033[0m\n'
row "empty title"      "https://example.com"            ""
row "whitespace title" "https://example.com"            "     "
row "title looks like url" "https://example.com/real"   "https://not-the-real-target.example"
row "very long URI"    "https://example.com/$(printf 'segment/%.0s' 1 2 3 4 5 6 7 8 9 10)?x=1" "long URI, short title"
printf '%-28s ' "unclosed link (last)"; printf '\033]8;;https://example.com\033\\never closed until here'
printf '\033]8;;\033\\\n'
printf '\n'
