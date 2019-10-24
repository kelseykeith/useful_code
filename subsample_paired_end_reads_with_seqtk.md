## Subsample Paired End Reads with `seqtk`

From the GitHub repository "Seqtk is a fast and lightweight tool for processing sequences in the FASTA or FASTQ format. It seamlessly parses both FASTA and FASTQ files which can also be optionally compressed by gzip." <https://github.com/lh3/seqtk> Program was written by Heng Li, who also wrote `bwa`.

#### General Subsample Cod

```bash
seqtk sample				# call the program + sample to subsample
	-s42					# Specifically the random seed with the -s flag, here 42. 
	R1.fastq.gz >			# fastq file to sample from
	R1_subsample.fastq	# filename to write to
```

#### Example

Example code. It **WON'T** work if you don't specificy the same random seed with `-s` for read 1 and read 2. `gzip` is optional; `seqtk` won't preserve the compression, so 

```bash
### subsample reads
# read 1
[kkeith]$ seqtk sample -s42 R1.fastq.gz 10000 | gzip > sub1000_R1.fastq.gz
# read 2
[kkeith]$ seqtk sample -s42 R2.fastq.gz 10000 | zip > sub1000_R2.fastq.gz
```