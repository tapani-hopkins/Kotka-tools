# tidy-up
R script for tidying up data downloaded from the Kotka database (https://kotka.luomus.fi/, public access https://laji.fi/). Converts dataset identifiers to human-readable format. Gets the trap names, sites and samples for data from the large-scale Malaise trapping (e.g. Amazon 2000, Uganda 2014-2015). Shortens the column names so they are easier to work with.


## 1 tidy up Kotka data.R
The main script. Open in R, check the parameters (especially the working directory!), and run. Before running, place the data you want to tidy up in "4 data to be tidied up". It should be saved as csv. Kotka generally gives the data as Excel which can be exported as csv.

## 2 resources
Data used by the script. Includes information on what datasets exist in Kotka, what samples were collected during the Malaise trapping, and how to convert these to plaintext. Also gives shorter versions of commonly used column names (Kotka often uses laboriously long column names such as "MYGathering[0][MYLatitude]").

## 3 functions
R functions used by the script.

## 4 data to be tidied up
Place the csv file(s) you want tidied up in here. There is an example file already here.

## 5 tidy data
The tidied up data files will be saved here. There is an example file already here.
