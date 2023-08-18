# licenseheaders
A fork branch from https://github.com/johann-petrak/licenseheaders to fix the license header on pingcap/tiflash repo

Usage:
```
# checkout or download the files to a machine with python (3.5 or higher)
gh repo clone JaySon-Huang/licenseheaders

# Use the script to fix the license headers
./fix_license.sh /path/to/tiflash

# (optional) then format the codes
cd /path/to/tiflash
python3 format-diff.py --diff_from `git merge-base upstream/master HEAD`
```
