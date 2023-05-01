#!/bin/sh
runs=${1:-10}
result_file=${2:-result.csv}
output_file=${3:-output.txt}
echo -n "" > ${result_file}
echo -n "" > ${output_file}
for benchmark in ./bin/*/*; do
  i=0
  echo -n ${benchmark} >> ${result_file}
  while [ "$i" -lt ${runs} ]; do
    echo "Running ${benchmark} for the ${i}th time"
    echo -n ", " >> ${result_file}
    output=`${benchmark}`
    echo $output >> ${output_file}
    echo "" >> ${output_file}
    echo $output | grep -oE 'results: \([0-9]*\)' | tr -d -c '[:digit:]' >> ${result_file}
    i=$(( i + 1 ))
  done
  echo "" >> ${result_file}
done
