# Written in R version 3.4.0
# CC0 Tapani Hopkins, Biodiversity Unit, University of Turku

# working directory (path to the folder on your computer which this file is in)
wd = "/Users/tapani/T/Courses/2020 Kotka data uploads/create-upload"



# --- Setup ---

# check that the working directory exists
tryCatch({
	setwd(wd)
}, error=function(e){
	stop(paste0("Could not find the working directory (should be the folder this script is in): \n", wd, "\n Check that variable 'wd' (at the start of the script) contains the correct folder, correctly typed."), call.=F)
})

# read functions used by the script
source("3 Functions/read.r")  # easy read csv files

# read data
sa = read("2 Resources/Malaise samples.csv")  # sample data
samples = read("4 Sample list.csv", 0)[,1]  # list of samples, only 1 column
what = read("2 Resources/Columns to extract.csv", 0)[,1]  # what columns to get from the sample data
datasets = read("2 Resources/Datasets for each sample.csv")  # what datasets to add (depends on sample)
kotka = read("2 Resources/Columns to include.csv", 0)  # what columns to include in the output Kotka file

# general variables
amazon = c("Amazon 1998", "Amazon 2000", "Amazon 2008", "Amazon 2011")  # Amazonian collecting events
uganda = "Uganda 2014-2015"
i = match(tolower(samples), tolower(sa$"MYOriginalSpecimenID"))  # index of each sample in 'sa', ignore case



# --- Get sample data ----

# get the sample data for each sample
a = sa[i, what]

# add datasets
ii = match(tolower(samples), tolower(datasets$"sample"))  # index of each sample in 'datasets', ignore case
a = cbind(a, datasets[ii,-1])  # add the datasets, but not the sample name (column 1)

# add the ID of the sample that the specimen came from
sampleID = sa[i, "MYObjectID"]  # get sample IDs
sampleID = paste0("http://mus.utu.fi/ZMUT.", sampleID)  # add the prefix to the sample IDs
a$"MYSeparatedFrom" = sampleID

# add data source
a$"MYDataSource" = NA  # start with blank column
ii = a$"MYGathering[0][MYCollectingEventName]" %in% amazon  # get specimens which are from Amazonia
a$"MYDataSource"[ii] = "https://doi.org/10.5281/zenodo.4030168"  # add zenodo dataset on Amazonian trapping
ii = a$"MYGathering[0][MYCollectingEventName]" %in% uganda  # get specimens which are from Uganda
a$"MYDataSource"[ii] = "https://doi.org/10.5281/zenodo.2225643"  # add zenodo dataset on Ugandan trapping

# add a mention of any unverified coordinates
a$"MYVerificationStatus[0]" = "Ok"  # default verification status is "Ok"
ii = sa[i, "MYVerificationStatus[0]"] == "VerifyCoordinates"  # rows in 'a' whose sample has unverified coordinates
a$"MYVerificationStatus[0]"[ii] = "VerifyCoordinates"

# return a blank row if the sample does not exist
a[is.na(i),] = NA


# --- Save specimen data ---

# create an empty data frame to save into
k = data.frame(matrix(, nrow=nrow(a), ncol=ncol(kotka)))
names(k) = names(kotka)

# add any data in 'kotka'
k[, names(kotka)] = kotka[3,]

# add the columns in 'a'
# this will overwrite any data added from 'kotka'
# this will create new columns if the columns aren't already in 'k'
k[, names(a)] = a

# add the 2nd header row from 'kotka'
# leave blank if the column is not in 'kotka'
k = rbind("",k)
k[1, names(kotka)] = kotka[2,]

# save as "5 results.csv"
write.table(k, file="5 results.csv", row.names=F, col.names=T, sep=",", dec = ".", na="", qmethod="double")
