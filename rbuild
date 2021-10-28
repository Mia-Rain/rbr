#!/bin/sh
. ${ptuiPath:-./ptui/ptui}
# this script ($0) should be sourced and used like a lib
IFS=""
rparse() { # work with the below mparse() using recursing to combine all of $@
  unset out
  for i in "$@"; do
    out=$(mparse "$out" "$1")
    shift 1
  done; echo "$out"
}
mparse() { # multiroom parse
  sa="$2"
  IFS=$(printf '\n\b')
  set -- $(printf '%s\n' "$1")
  IFS=""; n=0; while read -r two; do
    : $((n+=1)); [ "$n" -gt 9 ] && {
      shift 1
      : $((n-=1))
    }
    printf '%s\n' $(eval "printf '%s\n' \$$n")$two
  done << EOF
$(printf '%s\n' "$sa")
EOF
}
# index of some assests
wall=$(vline 3 0 '||') # 3x2 block of |'s
door=$(vline 3 1 '#') # 3x1 block of #'s 
corner=$(vline 2 0 '++') # 2x2 block of +'s
topwall=$(vline 2 0 '===') # 2x3 block of ='s # rparse
avatar="${avatar:-M}" # the default av is a literal `M`
. ./env # env file is used for various rendering data as well as the term size # user should manually configure this
IFS="x"; set -- ${MAX_ROOM_SIZE}; ST="$1"; SW="$2" # ST=SectorsTall SW=SectorsWide; 1 sector is 3 lines by 3 columns
until [ "$((LINES%3))" -eq 0 ]; do
  : $((LINES-=1))
done
until [ "$((COLUMNS%3))" -eq 0 ]; do 
  : $((COLUMNS-=1))
done # make the precevied term size smaller until it is a multiple of 3
MST="$((LINES/3))"; MSW="$((COLUMNS/3))" # MST=MaxSectorsTall MSW=MaxSectorsWide

