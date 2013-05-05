#!bin/bash


TOTAL_RUNS=2
SLEEP_SECONDS=1
for ((  i = 0 ;  i <= $TOTAL_RUNS;  i++  ))
do
  echo "Makefile Run No $i"
  make run
  echo "Sleep for $SLEEP_SECONDS seconds"
  sleep $SLEEP_SECONDS
done
