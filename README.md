GetClean_Project
================

This repository is the course project submission for the Getting and Cleaning Data course in the Johns Hopkins Data Science track. 

## Contents
The contents of this repository include:

- run_analysis.R: The R script that processes the raw Human Activity Recognition Using Smartphones Data Set and produces one data set for each of the 10299 observations of 86 mean and standard deviation variables and a second data set with the mean values of each variable for each subject/activity pair.
- ProjectCodeBook.md: Documentation of the data set and the processing steps.

## Processing Script (run_analysis.R)
The script, run_analysis.R, reads the extracted source data files and performs a series of 
transformations to create two data frames:
- combined.data: 10299 observations of 88 variables (Steps 1-4 of the assignment)
- tidy.data: 180 observations of 88 variables (Step 5 of the assignment)
the tidy.data data frame is written to a file, step5.txt which 

### Prerequisites
In order to run the script, it must be located in the same directory as the root directory of the
source data. Spaces must be eliminated from the source data root directory in order for the read.table
commands to reference the correct source data files ("UCI HAR Dataset" becomes "UCIHARDataset").

The plyr library must also be available. (It is loaded in step 3).

### Processing Steps
The script first executes a series of read.table commands to create data tables from the source txt files
that will be used in subsequent steps to process the data.

The "combined.data" data frame is the result of the following steps.
1. Merge the training and test sets to create one data set: The test data is appended to the training data using an rbind command.
2. Extract only the measurements on the mean and standard deviation for each measurement: The 561 variable names from the features.txt file are searched for the text strings "Mean", "mean", and "std" to create a vector of the column indexes which is used to subset the data. Two data fields are added to the observations data: 1) "subject" from subject_train.txt and subject_test.txt and 2) "activity" from the y_train.txt and y_test.txt files.
3. Add descriptive activity names: Descriptive names were defined as a character vector and substituted for the integer activity values in the source data.
4. Use descriptive variable names: The variable names were processed to make them all lower case and to remove problematic characters {( ) , -} substituting {_} where necessary for understandability.

The "tidy.data" data frame for step 5 uses the ddply command on combined.data to execute the mean 
function on each column for each subject/activity pair. The write.table command creates the step5.txt file
for the assignment submission.