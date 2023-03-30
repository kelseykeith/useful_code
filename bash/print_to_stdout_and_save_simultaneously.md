## Simulatenously Print and Save to File both `stdout` and `stderr`

Use `2>&1 | tee`. Breaking it down:

- `2>` redirects standard error to whatever comes after it
- `&1` includes standard output in the previous commmand
- `tee` is a program that reads from standard input and writes simultaneously from standard output and to a file <https://man7.org/linux/man-pages/man1/tee.1.html>

Example: `bash download_variantyx_batch5_group1.sh 2>&1 | tee download_variantyx_batch5_group1.log`