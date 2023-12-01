#! /bin/bash

set -e

function run_a_day() {
  for dir in ./day_*/
  do
    dir=${dir%*/}
    readarray -d "_" -t arr <<< "$dir"

    if [ $1 = ${arr[1]} ]; then
      cd $dir
      echo "---- Running: Day ${arr[1]} ----" | xargs
      v run main.v
    else
      echo "ERROR: Directory not found"
    fi
  done
}

function run_all_days() {
  for dir in ./day_*/
  do
    dir=${dir%*/}
    readarray -d "_" -t arr <<< "$dir"

    cd $dir
    echo "---- Running: Day ${arr[1]} ----" | xargs

    v run main.v

    echo
  done
}

if [ $1 = 'all' ]; then
  run_all_days
else
  num_regex='^[0-9]+$'
  if ! [[ $1 =~ $num_regex ]]; then
    echo "ERROR: Not a valid number" >&2; exit 1
  else
    run_a_day $1
  fi
fi

