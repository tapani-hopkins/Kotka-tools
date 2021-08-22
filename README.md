# Kotka-tools
Tools for processing data downloaded from the Kotka database (FinBif). (https://kotka.luomus.fi/, public access https://laji.fi/) The data is generally downloaded as an Excel file, and should be saved as csv for these tools. Designed for use at the Zoological museum of the University of Turku, mainly for the Ugandan and Amazonian Malaise trap data. But should be useable for anyone working with Kotka data.

## create-upload
R script for easy uploading of Ugandan and Amazonian wasps to the Kotka database. Give it the Malaise samples the wasps came from, it will create a file with almost everything you need (coordinates, dates..). This file can then be finished and uploaded to Kotka.

## tidy-up
R script for tidying up data that has been downloaded from Kotka. This makes it much easier to use in analyses. Converts dataset identifiers to human-readable format. Gets the trap names, sites and samples in easy-to-read format for data from the Ugandan and Amazonian Malaise trapping. Also tidies up the column names so they are easier to work with.
