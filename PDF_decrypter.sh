#!/bin/bash

# Create the decrypted directory if it doesn't already exist
mkdir -p decrypted

# Loop through all PDF files in the current directory
for file in *.pdf; do
  # Extract the password from the filename, assuming it's inside parentheses
  password=$(echo "$file" | sed -n 's/.*(\(.*\)).pdf/\1/p')

  # Define the output filename in the decrypted folder
  output="decrypted/$file"

  # Use qpdf to decrypt the file using the extracted password
  qpdf --password="$password" --decrypt "$file" "$output"
done
