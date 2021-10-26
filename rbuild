#!/bin/sh
. ./ptui/ptui
froom() {
  # 45 wide 14 tall
  n=0; until [ "$n" -eq "14" ]; do
    echo
    : $((n+=1))
  done
  hline 46 - 0; echo
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0
  dvline 3 0 '|||||' 36
  mvline 5 3 0 '|' 0
  dvline 3 0 '|||||' 36
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0 
  dvline 1 0 '|' 44 "$(./ptui/ptui hline 44 -)" 1 0
  hline 46 - 0; echo
  n=0; until [ "$n" -eq "14" ]; do
    echo
    : $((n+=1))
  done
}
froom
