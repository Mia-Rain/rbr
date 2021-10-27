#!/bin/sh
. ./ptui/ptui
IFS=""
mparse() { # multiroom parse
  sa="$2"
  IFS=$(printf '\n\b')
  set -- $(printf '%s\n' "$1")
  IFS=""; n=0; while read -r two; do
    : $((n+=1)); [ "$n" -gt 9 ] && {
      shift 1
      : $((n-=1))
    }
    printf '%s\n' $two$(eval "printf '%s\n' \$$n")
  done << EOF
$(printf '%s\n' "$sa")
EOF
# this actually works for 2 rooms at once 
}
froom() { # first room
  ex="                                         "
  hline 46 - 0
  echo
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0
  dvline 3 0 '|||||' 36
  hline 5 '|' 0; echo "$ex"                                 
  hline 5 '|' 0; echo "$ex"
  hline 5 '|' 0; echo "$ex"
  dvline 3 0 '|||||' 36
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0 
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0
  hline 46 - 0
  echo
}
