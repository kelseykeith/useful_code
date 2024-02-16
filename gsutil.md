# `gsutil` Cheat Sheet

`gsutil` is Google Cloud's command line utility (CLI). Documentation at <https://cloud.google.com/storage/docs/gsutil>

## Downloading

Example using gnomad Google Cloud bucket

- `cp` = make a local copy
- `-r` = copy recursively through folders
- `-m` = run operation in parallel
- `.` = need `.` at end for current directory

```bash
gsutil -m cp -r gs://gcp-public-data--gnomad/release/4.0/genome_sv/gnomad.v4.0.sv.chr1.vcf.gz.tbi .
```