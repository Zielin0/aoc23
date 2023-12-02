#!/bin/bash

set -e

run_a_day() {
  local day="$1"
  local dir="./day_${day}"

  if [ -d "$dir" ]; then
    cd "$dir" || exit

    echo "---- Running: Day $day ----"
    v run main.v
  else
    echo "ERROR: Directory for Day $day not found"
  fi
}

run_all_days() {
  for dir in ./day_*/; do
    local day=${dir#"./day_"}
    day=${day%/}
    
    cd "$dir" || exit

    echo "---- Running: Day $day ----"
    v run main.v
    
    echo

    cd ..
  done
}

if [ "$1" = 'all' ]; then
  run_all_days
else
  num_regex='^[0-9]+$'
  if ! [[ "$1" =~ $num_regex ]]; then
    echo "ERROR: Not a valid number" >&2; exit 1
  else
    run_a_day "$1"
  fi
fi