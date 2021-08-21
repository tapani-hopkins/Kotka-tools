## Script written in R version 3.4.0
## CC0 Tapani Hopkins, Biodiversity Unit, University of Turku


convert_data = function(x, out=c("start", "end", "sample", "trap", "site"), simplify=FALSE){
	
	## Function for converting data downloaded from the Kotka database 
	## (https://kotka.luomus.fi/, public access https://laji.fi/)
	## into something more human-readable.
	## Converts dataset identifiers such as "GX.1957" into plaintext "CCT1",
	## column "MySeparatedFrom" into the sample from which the specimen came,
	## and columns "MYGathering[0][MYDateBegin]" and "MYGathering[0][MYDateEnd]" into year-month-day format.
	## Returns the plaintext version of the data, 
	## with plaintext columns placed at the end of the file.
	## The converted columns are deleted if simplify is TRUE, otherwise kept.
	
	## Parameters:
	#   x:  	 path to the data file downloaded from Kotka (path to csv file which has two header rows)
	#   out:   what columns to output, character vector. Should be one of "start", "end", "sample" or one of the dataset types in "Kotka datasets.csv"". Default is to output the start date, end date, sample, trap and site. Any datasets that do not belong to the output columns are placed in a final column or columns.
	#  simplify:   if TRUE, replaces column names with shorter equivalents, and deletes columns which have been converted to plaintext
    
    # get the data (ignore second header row)
    x = read.csv(x, check.names=F, as.is=T)[-1,]
    
    # get datasets, their plaintext equivalents, and what type of dataset they are
    datasets = read.csv("2 resources/Kotka datasets.csv", as.is=T)
    
    # get samples and their plaintext equivalents
    samples = read.csv("2 resources/Kotka Malaise samples.csv", as.is=T)
    
    # get column names and their shorter equivalents
    columns = read.csv("2 resources/Kotka column names.csv", as.is=T)
    
    # get the columns in 'x' which contain datasets (e.g. "MYDatasetID[0]")
    dcolumns = grep("MYDatasetID", names(x))
    
    # initialise the columns in 'x' which have been converted to plaintext
    originals = integer(0)
    
    # create an empty data frame for the converted data
    converted = data.frame(matrix(data=NA, nrow=nrow(x), ncol=(length(out) + length(dcolumns))))
    colnames(converted) = out  
    
    # go through all the datasets in 'x' and save their plaintext names in 'converted'
    for(i in 1:nrow(x)){
    		for(d in dcolumns){
    			# get the row of this dataset in 'datasets' (the dataset data)
    			ii = match(x[i, d], datasets$id)
    			
    			# get the plaintext name and type of this dataset
    			plaintext = datasets$plaintext[ii]
    			type = datasets$type[ii]
    			
    			# if this dataset matches one of the output columns, place the plaintext there..
    			if(type %in% out){
    				converted[i, match(type, out)] = plaintext
    				
    			# if not, place the plaintext in the first empty (non-output) column
    			} else {
    				NAs = is.na(converted[i, ])
    				nonouts = ! names(converted) %in% out
    				firstempty = which(NAs & nonouts)[1]
    				converted[i, firstempty] = plaintext
    			}	
    		}
    }
    
    # mark the datasets as having been converted
    originals = c(originals, dcolumns)
    
    # get the samples as plaintext
    if ("sample" %in% out && "MYSeparatedFrom" %in% names(x)){
    			# get the plaintext equivalents and save in column "sample"
    		i = match(x$MYSeparatedFrom, samples$id)
    		converted$sample = samples$plaintext[i]
    		
    		# mark the column as having been converted
    		originals = c(originals, match("MYSeparatedFrom", names(x)))
    }
    
    # get the start date in year-month-day format
    if("start" %in% out && "MYGathering[0][MYDateBegin]" %in% names(x)){
    	# save in column "start"
    	converted$start = as.Date(x$"MYGathering[0][MYDateBegin]", format="%d.%m.%Y")
    	
    	# mark the column as having been converted
    	originals = c(originals, match("MYGathering[0][MYDateBegin]", names(x)))
    }
    
    # get the end date in year-month-day format
    if("end" %in% out && "MYGathering[0][MYDateEnd]" %in% names(x)){
    	# save in column "end"
    	converted$end = as.Date(x$"MYGathering[0][MYDateEnd]", format="%d.%m.%Y")
    	
    	# mark the column as having been converted
    	originals = c(originals, match("MYGathering[0][MYDateEnd]", names(x)))
    }   
    
    # remove extra (empty) columns in 'converted'
    # (how many columns are used depends on how many of the datasets went in output columns)
    notempty = colSums(!is.na(converted)) > 0
    converted = converted[, notempty]
    
    # add the plaintext data to 'x'
    X = cbind(x, converted)
    
    # if asked to simplify, remove columns which have been converted to plaintext, 
    # and simplify the column names
    if(simplify){
    		# remove those (non-plaintext) columns which have been converted
    		if(length(originals) > 0){
    			X = X[, -originals]
    		}
   		   		
    		# get the column names in 'X' which have a simpler equivalent
    		i = match(names(X), columns$name)
    		simples = !is.na(i)
    		
    		# replace the column names with their simpler equivalent
    		i = match(names(X)[simples], columns$name)
    		names(X)[simples] = columns$plaintext[i]
    }
        
    # return the data
    return(X)
}




