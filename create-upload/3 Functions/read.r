# Written in R version 3.4.0
# CC0 Tapani Hopkins, Biodiversity Unit, University of Turku



read = function(file, headers=2, ...){
	
	# read csv file
	# modified read.csv, adapted for easy handling of Kotka data
	#   file:   name of the file to be read
	#   head:   Number of rows of header. Only first header row is used.
	# returns the file as a data frame
	
	# get column names from first row
	cnames = read.csv(file, header=F, as.is=T, check.names=F, nrows=1, ...)
	
	# read the file, ignoring header rows, and add the column names
	a = read.csv(file, header=F, as.is=T, check.names=F, blank.lines.skip=F, skip=headers, col.names=cnames, ...)
	
	# return data frame
	return(a)
	
}