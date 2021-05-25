## Example ATAC-seq Pipeline

For the purposes of this example code, there are six samples, 3 control and 3 treatment. They were sequenced paired-end: 

| sample_id | read 1 | read 2 |
| --- | --- | --- |
| ctrl1 | crtl1_L001_R1.fastq.gz | crtl1_L001_R2.fastq.gz |
| ctrl2 | crtl2_L001_R1.fastq.gz | crtl2_L001_R2.fastq.gz |
| ctrl3 | crtl3_L001_R1.fastq.gz | crtl3_L001_R2.fastq.gz |
| treat1 | treat1_L001_R1.fastq.gz | treat1_L001_R2.fastq.gz |
| treat2 | treat2_L001_R1.fastq.gz | treat2_L001_R2.fastq.gz |
| treat3 | treat3_L001_R1.fastq.gz | treat3_L001_R2.fastq.gz |

### Quality Control

#### Check Quality with FastQC

```bash
[]$ fastqc *.fastq.gz -o fastqc/
```
#### Trim Adapters and Low Quality Sequences

```bash
[]$ for i in *R1.fastq.gz; do trim_galore --paired --fastqc --illumina --output ../output_directory --retain_unpaired -q 30 $i ${i/R1/R2}; done
```
### Process Reads

#### Align

Here we're aligning with `bowtie2` instead of `STAR`. `bowtie2` is a more general aligner, while `STAR` is specifically for RNA-seq because it's splice-aware. The other thing that's important is the `-X 2000` flag, which sets the maximum fragment length (by default 500 bp). It needs to be longer for ATAC-seq, because the transposase can cut around multiple histones, so the read mates can wind up farther apart than standard distance aligners assume for normal DNA or RNA sequencing.

```bash
[]$ cd trim_output_folder
[]$ for i in *R1_val_1.fastq.gz; do bowtie2 --very-sensitive -X 2000 -x /path/to/genome/folder -1 $i -2 ${i/R1/R2} -S ../path/to/output/folder${i/_L001_R1_val_1.fastq.gz/.sam} 2> ../path/to/output/folder/${i/_L001_R1_001.fastq.gz/_stats.txt}; done
```
#### Sort and Compress 

`bowtie2` outputs a SAM file; we want to store a sorted, compressed, and indexed BAM file because it's a smaller file size for long-term storage and many downstream programs require sorted and indexed files, so may as well do it now.

```bash
[]$ cd align_output_folder
### Step 1, sort the reads in order of where they aligned to the genome and compress the files.
# The sorting is necessary for some tools and also makes the file size smaller. Also the compression from SAM > BAM format makes the file size smaller.
[]$ for i in *.sam; do samtools sort $i -o ${i/.sam/.bam} -O BAM; done
### Index the BAM files
[]$ for i in *.bam; do samtools index $i; done
### Delete the SAM files; we only want to keep one copy of the aligned file around, so we want to keep the smaller BAM file
[]$ rm *.sam
```
#### Discard Duplicates

Use `picard MarkDuplicates` to remove PCR duplicates

```bash
[]$ for i in *.bam; do picard MarkDuplicates INPUT=$i OUTPUT=../path/to/output/folder/${i/.bam/_nodups.bam} METRICS_FILE=../path/to/output/folder/${i/.bam/remove_dup_metrics.txt} REMOVE_DUPLICATES=TRUE; done
```

#### Call Peaks

Use `macs2` to call peaks. Want to do it for all control files together and for all treatment files together

```bash
[]$ cd rm_duplicates_output_file
[]$ macs2 callpeak ctrl1_nodups.bam ctrl2_nodups.bam ctrl3_nodups.bam -f BAMPE -g hs -n ctrl --outdir ../path/to/output/folder/ -B --keep-dup all --nolambda
[]$ macs2 callpeak treat1_nodups.bam treat2_nodups.bam treat3_nodups.bam -f BAMPE -g hs -n treat --outdir ../path/to/output/folder/ -B --keep-dup all --nolambda
```















