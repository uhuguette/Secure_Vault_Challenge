#!/bin/bash
Vault="$secure/secure_vault"
mkdir -p "$Vault"
cd "$Vault"
touch keys.txt secrets.txt logs.txt
echo "Welcome to keys.txt" > keys.txt
echo "Welcome to secrets.txt" > secrets.txt
echo "Welcome to logs.txt" > logs.txt
echo "Secure vault was successfully created and all the files"
ls -l "$Vault"

