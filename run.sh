#!/bin/sh
runs=${1:-10}
result_file=${2:-result.csv}
echo -n "" > ${result_file}
for benchmark in ./bin/*/*; do
  i=0
  echo -n ${benchmark} >> ${result_file}
  while [ "$i" -lt ${runs} ]; do
    echo "Running ${benchmark} for the ${i}th time"
    echo -n ", " >> ${result_file}
    ${benchmark} | grep -oE 'results: \([0-9]*\)' | tr -d -c '[:digit:]' >> ${result_file}
    i=$(( i + 1 ))
  done
  echo "" >> ${result_file}
done
