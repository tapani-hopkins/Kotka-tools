# create-upload
Script for uploading wasps collected by Malaise trapping in Amazonia and Uganda to the Kotka database (https://kotka.luomus.fi/, public access https://laji.fi/). Just give the samples the wasps came from, and the script will fill in almost all the data you need: coordinates, dates, Kotka datasets etc. Creates a file which can be uploaded to Kotka.
The script is written in an older style, and the comments especially do not match the style used in other Kotka tools. Should be updated to the new style at some point for clarity. 



## 1 Create upload.r

The script. Open in R, check the working directory at the start of the script, then run. Before running, add the samples the wasps came from to "4 Sample list.csv".

## 2 Resources

Folder containing the files used by the script. This has the data on the Malaise samples, and information on what columns to include in the output Kotka excel. You can modify these to adjust what the script does (e.g. download updated sample data from Kotka and save it here). 


## 3 Functions

Functions used by the script.


## 4 Sample list.csv

What samples the wasps came from. Typically, you'll write down the wasp labels and get the sample from there (Amazonia), or just write down what sample the wasps came from (Uganda).   

Should have each wasp's sample on its own row. Case insensitive, i.e. you can write "h1-1" or "H1-1". 

Check the sample list "Malaise samples.csv" in "1 Resources" if you want to see how to write the samples. If the sample is not in the sample list, will create a mostly empty row in the Kotka excel.


## 5 results.csv

The csv file in Kotka format created by the script. This should have more or less everything, just add verbatim labels, species etc, then upload to Kotka. Overwritten whenever the script is run.

