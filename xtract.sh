#!/bin/bash

echo "Extracting... not really but its starting :)!"

# Locate the Firefox profile directory
firefox_profile_dir=$(find ~/.mozilla/firefox -type d -name "*.default-*" 2>/dev/null)

# Check if the profile directory was found
if [ -z "$firefox_profile_dir" ]; then
    echo "[!!!]Error: Could not locate the Firefox profile directory. Make sure Firefox is installed and a profile exists."
    exit 1
fi

# Create a backup folder
backup_dir=~/browser_backup
mkdir -p "$backup_dir"

# Extract browser history
echo "[+]Extracting browser history..."
if [ -f "$firefox_profile_dir/places.sqlite" ]; then
    sqlite3 "$firefox_profile_dir/places.sqlite" "SELECT url, title, last_visit_date FROM moz_places;" > "$backup_dir/firefox_history.txt"
else
    echo "[!!!]Error: places.sqlite file not found in $firefox_profile_dir."
fi

# Extract saved passwords (will be encrypted)
echo "[+]Extracting saved passwords..."
if [ -f "$firefox_profile_dir/logins.json" ]; then
    cp "$firefox_profile_dir/logins.json" "$backup_dir/firefox_passwords.json"
else
    echo "[!!!]Error: logins.json file not found in $firefox_profile_dir."
fi

# Extract cookies
echo "[+]Extracting cookies..."
if [ -f "$firefox_profile_dir/cookies.sqlite" ]; then
    sqlite3 "$firefox_profile_dir/cookies.sqlite" "SELECT host, name, value FROM moz_cookies;" > "$backup_dir/firefox_cookies.txt"
else
    echo "[!!!]Error: cookies.sqlite file not found in $firefox_profile_dir."
fi

# Output location
echo "Browser data extracted to $backup_dir"
