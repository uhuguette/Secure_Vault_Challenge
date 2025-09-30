#!/usr/bin/bash

Vault="$secure/secure_vault"

if [ ! -d "$Vault" ]; then
    echo " Error: Secure Vault not foun"
    exit 1
fi
echo "        Secure Vault Monitoring          "

for file in "$Vault"/*; do 
if [ -f "$file" ]; then
filename=$(basename "$file")
size=$(stat -c %s "$file")   
        lastmod=$(stat -c %y "$file")          
        perms=$(stat -c %A "$file")            
        permnum=$(stat -c %a "$file")

echo "File: $filename"
echo "Size: $size bytes"
echo "Last modified: $lastmod"
echo "Permissions: $perms($permnum)"
echo 
fi
done
