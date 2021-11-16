`du -ch $(find /mnt/data/data_jj/yb5/novaseq_hg38_pEGFPN1/kk_align/ -type f -name "*tmp*") | tail -1 | cut -f 1`



## Get Total Size of Files
Mainly from this StackOverflow post <https://stackoverflow.com/questions/21989860/get-total-size-of-a-list-of-files-in-unix>

```bash
### general format
du -ch $(find /path/to/files/ -type f -name "*wildcard_match_files") | tail -1 | cut -f 1

### specific example
du -ch $(find /mnt/data/data_jj/yb5/novaseq_hg38_pEGFPN1/kk_align/ -type f -name "*tmp*") | tail -1 | cut -f 1
```