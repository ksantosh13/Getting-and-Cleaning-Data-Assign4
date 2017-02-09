# Class Project for "Getting and Cleaning Data"

The class project for Getting and Cleaning Data was to read in the "Human Activity Recognition Using Smartphones" data set, perform an analysis on the data set, and output a tidy data set.


## The code run_analysis.R is split into following sections:
* Download the file
* Unzipping the file
* Getting the list of files
* Reading the files into data tables
* Concatenating the data tables by rows
* naming the columns
* Filtering the data with column name having only means and std
* Renaming the column with tidy text in the final table
* Manipulating the data to get desired data set and Writing final data to a file

Note that it requires the reshape2 package, which can be downloaded from CRAN.

The output of the R script is a tidy data set, tidydata.txt.

You can read more about the data and the analysis in the codebook.md and comments in run_analysis.
