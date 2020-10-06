## Check MD5sums FastQ Files

If the directory tree looks like this, with MD5 files in subdirectories, will need to jump in and out of the directories to verify the sums.

```bash
[kkeith@cbix 2020-06-23_rnaseq_human_ipsc_brainoids_jj]$ tree
.
├── brainoids_rnaseq_2020-06-23.txt
├── brainoids_rnaseq_2020-06-23.xlsx
├── Brain\ organoids\ RNA\ Seq\ Novogene\ sample\ sheet.xlsx
├── brain\ orgs\ RNA\ trizol\ nano.jpg
├── Brain_orgs_Trizol_RNA_2020-05-07_13-39-24.pdf
├── md5_logfile.txt
└── usftp1.novogene.com
    └── X202SC20051498-Z01-F001
        ├── checkSize.xls
        ├── raw_data
        │   ├── J1
        │   │   ├── J1_FRAS202353579-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J1_FRAS202353579-1r_H5G77DSXY_L2_2.fq.gz
        │   │   └── MD5.txt
        │   ├── J2
        │   │   ├── J2_FRAS202353580-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J2_FRAS202353580-1r_H5G77DSXY_L2_2.fq.gz
        │   │   └── MD5.txt
        │   ├── J3
        │   │   ├── J3_FRAS202353581-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J3_FRAS202353581-1r_H5G77DSXY_L2_2.fq.gz
        │   │   └── MD5.txt
        │   ├── J4
        │   │   ├── J4_FRAS202353582-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J4_FRAS202353582-1r_H5G77DSXY_L2_2.fq.gz
        │   │   └── MD5.txt
        │   ├── J5
        │   │   ├── J5_FRAS202353583-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J5_FRAS202353583-1r_H5G77DSXY_L2_2.fq.gz
        │   │   └── MD5.txt
        │   ├── J6
        │   │   ├── J6_FRAS202353584-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J6_FRAS202353584-1r_H5G77DSXY_L2_2.fq.gz
        │   │   └── MD5.txt
        │   ├── J7
        │   │   ├── J7_FRAS202353585-1r_H3V3JDSXY_L1_1.fq.gz
        │   │   ├── J7_FRAS202353585-1r_H3V3JDSXY_L1_2.fq.gz
        │   │   ├── J7_FRAS202353585-1r_H5G77DSXY_L2_1.fq.gz
        │   │   ├── J7_FRAS202353585-1r_H5G77DSXY_L2_2.fq.gz
        │   │   ├── J7_FRAS202353585-1r_H5JFWDSXY_L3_1.fq.gz
        │   │   ├── J7_FRAS202353585-1r_H5JFWDSXY_L3_2.fq.gz
        │   │   └── MD5.txt
        │   └── Rawdata_Readme.pdf
        └── report
            └── X202SC20051498-Z01-F001_final_20200615110937.zip
```

```bash
# to make it easy for yourself go to the directory one level above the directories with the MD5 files in them        
cd usftp1.novogene.com/X202SC20051498-Z01-F001/raw_data/
# for each folder go in, check the md5sum and write it to a file in the top level folder for the data, then return to the folder above
for i in J?; do cd $i; echo $i; md5sum -c MD5.txt | sed -s 's/://g' | sed -s 's/ \+/\t/g' >>  ../../../../md5_check.txt; cd ../; done
```