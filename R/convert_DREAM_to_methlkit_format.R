
### script to convert DREAM mctables to methylkit format
### FIRST ARGUMENT should be the file you want to convert
### SECOND ARGUMENT should be the name to want to write 
### converted file as

library(tidyverse)

# read the arguments form the command line
args  <- commandArgs(TRUE)

# read the table in
read_tsv(args[1]) -> data

data %>%
  filter(chromosome %in% c('chr1', 'chr2', 'chr3', 'chr4', 'chr5', 
                    'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 
                    'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 
                    'chr16', 'chr17', 'chr18', 'chr19', 'chr20', 
                    'chr21', 'chr22', 'chrX', 'chrY')) %>%
  unite(chrBase, chromosome, position, sep = '.', remove = F) %>%
  rename(chr = chromosome, base = position, coverage = t, freqC = mc11) %>%
  mutate(freqT = round((100 - freqC), 2),
         strand = '.') %>%
  select(chrBase, chr, base, strand, coverage, freqC, freqT) %>%
  write_tsv(args[2])