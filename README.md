# Kotka-tools
Tools for processing data downloaded from the Kotka database (FinBif). (https://kotka.luomus.fi/, public access https://laji.fi/) The data is generally downloaded as an Excel file, and should be saved as csv for these tools. Designed for use at the Zoological museum of the University of Turku, mainly for the Ugandan and Amazonian Malaise trap data. But should be useable for anyone working with Kotka data.

## create-upload
R script for easy uploading of Ugandan and Amazonian wasps to the Kotka database. Give it the Malaise samples the wasps came from, it will create a file with almost everything you need (coordinates, dates..). This file can then be finished and uploaded to Kotka.

## tidy-up
R script for tidying up the data. Converts dataset identifiers to human-readable format. Gets the trap names, sites and samples for data from the Malaise trapping (e.g. Amazon 2000, Uganda 2014-2015). Also tidies up the column names so they are easier to work with.
