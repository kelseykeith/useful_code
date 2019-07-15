## How to Replace Many Spaces with One Tab

Mostly copied from this Stack Exchange post <https://unix.stackexchange.com/questions/19014/how-to-strip-multiple-spaces-to-one-using-sed>

```bash
cat file.txt | sed 's/ \+/\t/g' > file.tsv
```
-

#### sed Command Breakdown

- sed = stream editor
- s = substitute
- / = breaks for sed
-  \+ = match one or more spaces (there is a space at the beginning)
- \t = tab
- g = global