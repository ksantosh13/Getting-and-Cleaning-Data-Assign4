# Code Book

This is a code book that describes the variables, the data, the function etc that is performed to clean up the data in run_analysis.R and to generated final data

## Data Dource
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Explanation of each file

* features.txt: Names of the 561 features.
* activity_labels.txt: Names and IDs for each of the 6 activities.
* X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
* y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
* X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
* y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

More information about the files is available in README.txt. More information about the features is available in features_info.txt

## Subject and Activity

These variables identify the unique subject/activity pair the variables relate to:

* Subject: the integer subject ID.
* Activity: the string activity , name: Walking, Walking Upstairs, Walking Downstairs, Sitting,
Standing, Laying

## Variables

The script run_analysis contains several variables. Below is explained what they are for.

* path_rf: string, contains the name of the directory where the unzipped data is stored
* file: string, name of downloaded dataset file
* XTrainFile:table containing all X_train file data
* XTestFile: table containing all X_test file data
* YTrainFile: table containing all Y_train file data
* YTestFile: table containing all Y_test file data
* SubjectTrainFile: table containing all Subject_train file data
* SubjectTestFile: table containing all subect_test file data
* FeaturesFile: table containing all features file data
* ActivityLabelsFile: table containing all activity_labels file data
* XTrainTest: table containing all X_train and X_train file data
* YTrainTest: table containing all Y_train and Y_test file data
* SubjectTrainTest: table containing all subject_train and subject_test file data
* AllData:  table containing all XTrainTest, YTrainTest and SubjectTrainTest file data
* onlyMeans:  table containing only means columns from AllData data
* onlyStd:   table containing only std columns from AllData data
* SubColoumns:   table containing only means and std columns from AllData data
* tempDataFrame: table containing only means and std columns from AllData data with subject and activity
* newDataFrame: table containing only means and std columns from AllData data removing meanFreq
* tidyFrame: table containing data after processing


The code is split into following sections:
* Download the file
* Unzipping the file
* Getting the list of files
* Reading the files into data tables
* Concatenating the data tables by rows
* naming the columns
* Filtering the data with column name having only means and std
* Renaming the column with tidy text in the final table
* Manipulating the data to get desired data set and Writing final data to a file tidydata.txt
