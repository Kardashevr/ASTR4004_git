#!/bin/bash

# 1. 
# Print the home directory path
echo $HOME
# Print the username
echo $USER

# 2. 
# Define the variable 'nonsense' with a string
nonsense='This is such a nonsense!'
# Print the variable 'nonsense'
echo $nonsense

# 3.
# Write 'nonsense' to a new file 'nonsense.txt'
echo $nonsense > nonsense.txt
# Print that this file was just created/overwritten
echo "nonsense.txt has been created/overwritten"

# 4.
# Replace spaces with underscores in 'nonsense'
nonsense_=${nonsense// /_}
# Append the modified string to 'nonsense.txt'
echo $nonsense_ >> nonsense.txt

# 5.
# Replace 'such a' with 'not' in 'nonsense'
nonsense5=${nonsense/'such a'/'not'}
# Append " It's Bash" to the new variable
nonsense5+=' It’s Bash'
# Append the modified string to 'nonsense.txt'
echo $nonsense5 >> nonsense.txt

# 7. 
# Print the home directory path without slashes
echo $HOME | tr -d '/'