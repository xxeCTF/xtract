# Xtract, a Firefox Plaintext Backup Script.

This script extracts your **saved passwords**, **bookmarks**, **history**, and **cookies** from Firefox and stores them in plaintext `.txt` files inside a backup directory.

## What it Backs Up

The script grabs data from the following Firefox files:

| Data Type   | Source File         |
|-------------|---------------------|
| Passwords   | `logins.json`, `key4.db` |
| Bookmarks   | `places.sqlite`     |
| History     | `places.sqlite`     |
| Cookies     | `cookies.sqlite`    |

Output is saved in a `.txt` format for each category.

---

## Usage


``` term

chmod +x xtract.sh
./firefox_backup.sh

or

bash xtract.sh

```

Backups will be saved in a directory named browser_backup in your home directory.





---


Firefox stores user data in profiles located under:

`~/.mozilla/firefox/`

This script uses a pattern to automatically detect the correct profile directory, searching for:

*.default-release

*.default-esr

*.default


If the Script Doesn't Work the First Time

Firefox can create multiple profiles (especially after updates or ESR installations). If the script doesn’t extract your data the first time:

1. Manually check which profiles exist:

  ``` term

Navigate to your home directory 

cd ~/.mozilla/firefox/

mousepad profiles.ini&

```


2. Look for Paths ending in .default, .default-release, or .default-esr.


3. You can also manually override the profile path by editing the script or adding logic to handle custom profiles.




---

Requirements

- Bash

- Firefox installed with at least one user profile

- sqlite3 (for reading bookmarks, history, and cookies)


Install sqlite3 if not present:

`sudo apt install sqlite3`


---

Disclaimer

This script is for personal use only. It extracts sensitive data in plaintext — handle it responsibly.

Do not use this on someone else without permission.





