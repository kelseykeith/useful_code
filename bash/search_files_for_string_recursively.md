## How to Recursive Search through All Files for a String with `egrep`

Thanks to this Stack Overflow post <https://stackoverflow.com/questions/6153152/find-files-containing-a-given-text>

---

#### Search for a Text String with `egrep`

```bash
egrep -lir --include=REGEX-SELECTION-CRITERIA "STRING" directory/to/search/

# real example from OpenPedCan-api
egrep -lir --include=* "CNV_SCHEMA" .
```

Arguments:
- flags
  - r = recursive
  - i = 
  - l = return names of files only, otherwise returns "file_name: line with text searched for"
- include
- string you're searching for in ""
- directory to start the recursev