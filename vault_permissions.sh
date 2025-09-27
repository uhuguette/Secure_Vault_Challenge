#!/bin/bash
Vault="$secure/secure_vault"
if [[ ! -d  "$Vault" ]]; then
echo "error: secure_vault doent exist!!"
exit 1
fi

update_perm() {
  local file="$1"
  local default="$2"
  local filename=$(basename "$file")

 echo
  echo "Current permissions for $filename:"
  ls -l "$file"

  read -rp "Do you want to update permissions for $filename? (yes or no): " input

  if [[ "$input" == "yes" ]]; then
    read -rp "Enter new permission: " newperm
    chmod "$newperm" "$file"
    echo "$filename updated to $newperm"
  elif [[ -z "$input" ]]; then
    chmod "$default" "$file"
    echo "$filename set to default $default"
  else
    echo "$filename left unchanged."
  fi
}
update_perm() {
  local file="$1"
  local default="$2"
  local filename=$(basename "$file")

  echo
  echo "Current permissions for $filename:"
  ls -l "$file"

  read -rp "Do you want to update permissions for $filename? (yes or no): " input

  if [[ "$input" == "yes" ]]; then
    read -rp "Enter new permission: " newperm
    chmod "$newperm" "$file"
    echo "$filename updated to $newperm"
  elif [[ -z "$input" ]]; then
    chmod "$default" "$file"
    echo "$filename set to default $default"
  else
    echo "$filename left unchanged."
  fi
}
update_perm "$Vault/keys.txt" 600
update_perm "$Vault/secrets.txt" 640
update_perm "$Vault/logs.txt" 644
echo "Your final permissions are:"
ls -l "$Vault"

