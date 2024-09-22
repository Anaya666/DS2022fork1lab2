#!/bin/bash

# Step 1: Download the tarball
curl -o lab3-bundle.tar.gz https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

# Step 2: Decompress the tarball
tar -xzvf lab3-bundle.tar.gz

# Step 3: Remove empty lines from the TSV file
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned_data.tsv

# Step 4: Convert TSV to CSV
tr '\t' ',' < cleaned_data.tsv > data.csv

# Step 5: Count the lines (excluding headers) in the CSV file
line_count=$(($(wc -l < data.csv) - 1))

# Echo the line count
echo "Number of data rows (excluding header): $line_count"

# Step 6: Create a new tarball with the cleaned CSV file
tar -czvf converted-archive.tar.gz data.csv

