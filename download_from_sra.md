## Download Files from SRA

```bash
### Start a tmux first so this can run along on its own
[]$ tmux new -s download
### download using fasterq-dump from SRA tools
[]$ for i in $(cut -f1 SRR_Acc_List.txt); do /usr/local/programs/sra_toolkit/sratoolkit.2.9.6-centos_linux64/bin/fasterq-dump $i; done
### gzip
[]$ for i in *.fastq; do gzip $i; done
### Change permissions to read-only so you can't accidentally edit the sequencing data
[]$ for i in *.fastq.gz; do chmod 444 $i; done
```