This folder contains the resources used by "2 Get sample data.r". Modify these to change what the script does.


# Malaise samples.csv

The sample data. In Kotka format, if wanting to update e.g. coordinates of specific samples, download from Kotka. Not all Ugandan columns have been included (e.g. separated to specimens are not relevant here). For the Amazonian data, it may be better not to have anything in column "MYGathering[0][MYDateVerbatim]" even if this is added in future, what's on the wasp's label may differ from what is on the sample label.


# Datasets for each sample.csv

What Kotka datasets to add for each sample. The datasets give the sampling event, forest type, trap and damage (in that order). The damage column contains "GX.2010" if the sample was damaged in some way, otherwise blank. These are easier to get from this file than from the sample data, since the datasets may be in random order in the sample data.


# Columns to extract.csv

List of columns to extract from the sample data. Kotka names (1st header row in Kotka). Each column name to be extracted on its own row in this file.


# Columns to include.csv

What columns to have in the output file "5 results.csv". In Kotka format, two header rows. Also has a third row which can be blank or have default data.

If you want to change the order of the output file, change the order here. If you want to have more columns, download them from Kotka and add here.

If you want to have some default data (e.g. collection ID "HR.1648"), add it to the third row. It will be copied to the whole column in the output file (but overwritten by any sample data, if such exists).

Any columns in "Columns to extract.csv" which are not here will be added to the end of the output file.
