#!/bin/bash

# Prompt the user to enter a password
echo "Please enter a password for encrypting PDF files:"
read -s password  # '-s' flag hides the input for security

# Create the encrypted directory if it doesn't already exist
mkdir -p encrypted

# Loop through all PDF files in the current directory
for file in *.pdf; do
  # Define the output filename in the encrypted folder
  output="encrypted/$file"

  # Use qpdf to encrypt the file with the provided password
  qpdf --encrypt "$password" "$password" 256 -- "$file" "$output"
done

echo "Encryption complete. Encrypted files are stored in the 'encrypted/' directory."
