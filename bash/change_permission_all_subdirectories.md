## How to Change the Permissions of a Directory and its Sub-directories in One Commands

```bash
find directory_name -type d -exec chmod 775 {} \;

# real example, changing permission on multiple directories and their subdirectories
# from /mnt/data/research_data
find 2019-08-29_* -type d -exec chmod 775 {} \;
```