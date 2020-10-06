## Combine DREAM Technical Replicates
*2020-06-01*

To combine DREAM technical replicates simply compute a weighted average of their methylation percentages for each CpG:

```
m = (n1*m1 + n2*m2) / (n1 + n2)
```
where m is the corrected methylation (mc9 in the current DREAM tables) and n is the coverage. 

m1 = corrected methylation percentage sample 1
n1 = coverage sample 1
m2 = corrected methylation percentage sample 2
n2 = coverage sample 2