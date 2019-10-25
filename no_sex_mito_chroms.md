## Remove X, Y, M Chromosomes from Bismark `.cov.gz` Files

Often, we remove the sex and mitochondrial chromosomes before doing further analysis to control for sex, and the over-representation of mitochondrial reads. Here's some bash code to remove the X, Y, and M chromosomes from Bismark methylation coverage files

```bash
# go to the folder on the server where the data was analyzed, then change into the folder that has the methylation count files
[kkeith]$ cd methyl_extract20mm9/
# make a directory to put the modified files in
[kkeith]$ mkdir no_sex_mito
# drop the X, Y, and M chromosomes using grep -v
[kkeith]$ for i in *bismark.cov.gz; do zcat $i | grep -v chr[XYM] | gzip > no_sex_mito/${i/_trimmed_bismark_bt2.bismark.cov.gz/_noXYM.bismark.cov.gz}; done
```