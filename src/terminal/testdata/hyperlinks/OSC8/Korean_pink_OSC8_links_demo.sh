#!/bin/sh
# Korean Wikipedia links: OSC 8 hyperlinks in pink (256-color 213)
link() { printf '  \033[38;5;213m\033]8;;%s\033\\%s\033]8;;\033\\\033[0m\n' "$2" "$1"; }

link '홍류저수지'          'https://ko.wikipedia.org/wiki/%ED%99%8D%EB%A5%98%EC%A0%80%EC%88%98%EC%A7%80'
link '산외중학교'          'https://ko.wikipedia.org/wiki/%EC%82%B0%EC%99%B8%EC%A4%91%ED%95%99%EA%B5%90'
link '아밀카레 폰키엘리'   'https://ko.wikipedia.org/wiki/%EC%95%84%EB%B0%80%EC%B9%B4%EB%A0%88_%ED%8F%B0%ED%82%A4%EC%97%98%EB%A6%AC'
link '프로'                'https://ko.wikipedia.org/wiki/%ED%94%84%EB%A1%9C'
link '초코보'              'https://ko.wikipedia.org/wiki/%EC%B4%88%EC%BD%94%EB%B3%B4'
link '유창 (안성사후)'     'https://ko.wikipedia.org/wiki/%EC%9C%A0%EC%B0%BD_%28%EC%95%88%EC%84%B1%EC%82%AC%ED%9B%84%29'
