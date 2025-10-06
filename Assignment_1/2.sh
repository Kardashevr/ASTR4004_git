#!/bin/bash

# 1.

# 2.
# Download the file
wget http://www.mso.anu.edu.au/~chfeder/teaching/astr_4004_8004/material/mM4_10048_pdfs/EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data

# 3. 
# Search and show all lines with ’sigma’
grep 'sigma' EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data

# 4. 
# Search and show the line with 'sigma' and the line after it
grep -A 1 'sigma' EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data

# 5.
# Search and show the line with 'sigma' and the line after it, excluding the line with 'sigma'
grep -A 1 'sigma' EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data | grep -v 'sigma'

# 6. 
# Show the help message of Bash
bash --help

# 7. 
# Only show the two lines that explain the usage details of Bash
bash --help | grep -A 1 '^Usage'

# 8. 
# Count the number of words in the last message
bash --help | grep -A 1 '^Usage' | wc -w

# 9.
# Add ’Number of words:’ in front of the previous output and print to the screen
echo "Number of words: $(bash --help | grep -A 1 '^Usage' | wc -w)"

# 10. 
# Extract the entire header (first 11 lines) of the file and redirect the output to a file
awk 'NR <= 11' EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data > header.txt

# 11. 
# Extract the first column of the data (excluding the header) and redirect the output to a file
awk 'NR > 11 {print $1}' EXTREME_hdf5_plt_cnt_0050_dens.pdf_ln_data > column1.txt
