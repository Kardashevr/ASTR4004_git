#!/bin/bash

# 1.
# Print numbers 1 to 20, one per line
for i in {1..20}; do
  echo $i
done
echo

# 2. 
# Print numbers 1 to 20 on a single line, separated by spaces
for i in {1..20}; do
  echo -n "$i "
done
echo

# 3.
# Print numbers 1 to 20, padded with zeros and separated by commas
for i in {1..20}; do
  printf "%02d, " "$i"
done
echo

# 4. 
# Print numbers 1 to 20, padded with zeros, separated by commas, with no comma after the last number
for i in {1..20}; do
  if [ "$i" -eq 20 ]; then
    printf "%02d" "$i"
  else
    printf "%02d, " "$i"
  fi
done
echo

# 5.
# List all files and directories in root with prefix
for item in /*; do
  echo "Listing item in root: $item"
done