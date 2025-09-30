#!/usr/bin/bash

Vault="$secure/secure_vault"

if [ ! -d "$Vault" ]; then
	echo "secure vault not found"
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

if [ "$permnum" -gt 644 ]; then
	echo "⚠ Security Risk Detected" >> "$filename"
fi
echo >> "$filename"
fi
done

echo "✅ Vault report created at: $filename"
