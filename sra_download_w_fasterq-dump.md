## Download FastQ Files from SRA Using `fasterq-dump`

```bash
[]$ tmux new -s download
[]$ for i in $(cat SRR_Acc_List.txt); do /usr/local/programs/sra_toolkit/sratoolkit.2.9.6-centos_linux64/bin/fasterq-dump $i; done
```