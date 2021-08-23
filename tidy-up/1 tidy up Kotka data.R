## Script written in R version 3.4.0
## CC0 Tapani Hopkins, Biodiversity Unit, University of Turku

## This script tidies up data downloaded from the Kotka database
## (https://kotka.luomus.fi/, public access https://laji.fi/).
## Adds trap names, sites and samples as plaintext.
## Converts any other dataset identifiers to plaintext.
## Converts dates to year-month-day format.
## The data to be tidied up should saved as a csv file, and placed in "4 data to be tidied up".
## (note that Kotka downloads as Excel, this will need to be saved as csv)
## The tidied up data is placed in "5 tidy data". Any files of the same name are overwritten!


## Parameters

# working directory (path to the folder on your computer which this file is in)
wd = "/Users/tapani/T/Courses/2020 Kotka data tools"

# simplify data by removing datasets that have been converted to plaintext, 
# renaming columns etc (TRUE / FALSE)
simplify = TRUE


## Setup

# try to set the working directory..
tryCatch({
	setwd(wd)
}, 

# .. if the directory doesn't exist, give a warning message
error=function(e){
	stop(paste0("Could not find the working directory (should be the folder this script is in): \n", wd, "\n Check that variable 'wd' (at the start of the script) contains the correct folder, correctly typed."), call.=F)
})

# import
source("3 functions/convert_data.R")

# get the files to be tidied up
originals = list.files("4 data to be tidied up")


## Tidy up

for(p in originals){
	# tidy up the data
	path = paste0("4 data to be tidied up/", p)
	tidydata = convert_data(path, simplify=simplify)
	
	# save the tidied data
	path = paste0("5 tidy data/", p)
	write.csv(tidydata, file=path, na="", row.names=F)
}

