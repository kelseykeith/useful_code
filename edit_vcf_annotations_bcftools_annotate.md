# How to remove annotations

<https://samtools.github.io/bcftools/bcftools.html#annotate>

```
# -x means remove
# ^ means except for the comma-separated list of columns following
# -x + ^ here means remove everything from the info field except the sections listed
bcftools annotate -x ^INFO/AS_FilterStatus,INFO/AS_SB_TABLE,INFO/DP,INFO/ECNT,INFO/MBQ,INFO/MFRL,INFO/MMQ,INFO/MPOS,INFO/OCM,INFO/POPAF,INFO/RPA,INFO/RU,INFO/STR,INFO/TLOD IonXpress_010.hg38_multianno.vcf > test.vc
```