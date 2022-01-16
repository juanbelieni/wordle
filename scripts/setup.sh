#!/bin/sh

url="https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt"
curl -s $url | tr '\r\n' '\n' > words.txt
