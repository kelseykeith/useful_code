
### Run a tSNE on the Server
# It takes 4 arguments:
# 1. The name of the matrix you want to run the tSNE on. It needs to have the 
# thing you want to visualize in the plot (ex: cells, samples) as the rows and
# whater you measured (expression, methylation) as the columns.
# 2. The perplexity for the tSNE. Roughly, perplexity tells the algorithm how 
# to balance local and global perplexity. The default in Rtsne::Rtsne is 30, so 
# use that if you're unsure, or try varying it. HOWEVER, the perplexity should 
# NOT exceed your number of samples. Typically it's a number between 5 and 50.
# 3. The number of dimensions return. More than 3 is not recommend because of 
# increase in the computational power needed.
# 4. The name you want to save the output file as. This will output a small 
# table with the same rows as the original table and as many columns as 
# dimensions given with coordinates for plotting.

library(Rtsne)

### make a function to run a tSNE
main <- function() {
# read the command-line arguments
	args <- commandArgs(trailingOnly = TRUE)
# assign the first argument to filename
	filename <- args[1]
# assign the second argument to perplexity
	perplexity <- args[2]
# assign the third command-line argument to dimensions
	dimensions <- args[3]
# assign the fourth and last command-line argument to tsne_name
	tsne_name <- args[4]
# read the data in and save it as dat
	dat <- read.table(file = filename, header = TRUE)
# run the tSNE; data must be a matrix
	tsne <- Rtsne(as.matrix(dat), 
# want check duplicates set to F, because if ANY data is duplicated it throws
# an error
	              check_duplicates = FALSE, 
	              perplexity = as.numeric(perplexity), 
	              dims = as.numeric(dimensions))
# save the tsne to the file specified
	write.table(tsne$Y, tsne_name, sep = '\t', row.names = FALSE)
}

### execute the function
main()
