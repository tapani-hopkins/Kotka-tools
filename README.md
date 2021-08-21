# Kotka-tools
Tools for processing data downloaded from the Kotka database (FinBif). (https://kotka.luomus.fi/, public access https://laji.fi/) The data is generally downloaded as an Excel file, and should be saved as csv for these tools. Designed for use at the Zoological museum of the University of Turku, but should be useable for anyone working with Kotka data.

## tidy-up
R script for tidying up the data. Converts dataset identifiers to human-readable format. Gets the trap names, sites and samples for data from the larger Malaise trapping events (e.g. Amazon 2000, Uganda 2014-2015). Shortens the column names.
