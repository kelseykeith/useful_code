## The Problem of Weird Double Peaks in `deeptools` Traces

In order to avoid the double peak on `deeptools` traces, you need to calculate the matrix using a **directional** bed file, with a sixth column indicating strand. I ended up downloading and using the `ngs.plot` bed files

```bash
### for example, to calculate this matrix, in the directory on cbix /home/kkeith/data/itempera_lab/parp_paper/, you use a directional bed file
(deeptools)[kkeith]$ computeMatrix scale-regions --scoreFileName parp_bamCompare.bw --regionsFileName hg38/ngsplot_genebody_stranded
.bed --outFileName parp_ngsplot_genebody.matrix.gz -b 400 -a 400 -p 24

(deeptools)[kkeith]$ head hg38/ngsplot_genebody_stranded.bed 
chr19	58346806	58353499	A1BG	.	-
chr10	50799409	50885675	A1CF	.	-
chr12	9067708	9115962	A2M	.	-
chr12	8822554	8876785	A2ML1	.	+
chr1	33306766	33321098	A3GALT2	.	-
chr22	42692121	42720870	A4GALT	.	-
chr3	138123718	138132387	A4GNT	.	-
chr12	53307456	53321628	AAAS	.	-
chr12	125065379	125143325	AACS	.	+
chr3	151814073	151828488	AADAC	.	+
```