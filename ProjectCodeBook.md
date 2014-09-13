# Contents
1. Source Data
2. Processing Script
3. Output Data

#1. Source Data
The data was downloaded on September 9, 2014 from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A description of the source data is available at:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 


#2. Processing Script
The script, run_analysis.R, reads the extracted source data files and performs a series of 
transformations to create two data frames:
- combined.data: 10299 observations of 88 variables (Steps 1-4 of the assignment)
- tidy.data: 180 observations of 88 variables (Step 5 of the assignment)

## Prerequisites
In order to run the script, it must be located in the same directory as the root directory of the
source data. Spaces must be eliminated from the source data root directory in order for the read.table
commands to reference the correct source data files ("UCI HAR Dataset" becomes "UCIHARDataset").

The plyr library must also be available. (It is loaded in step 3).

## Processing Steps
The script first executes a series of read.table commands to create data tables from the source txt files
that will be used in subsequent steps to process the data.

The "combined.data" data frame is the result of the following steps.
1. Merge the training and test sets to create one data set: The test data is appended to the training data using an rbind command.
2. Extract only the measurements on the mean and standard deviation for each measurement: The 561 variable names from the features.txt file are searched for the text strings "Mean", "mean", and "std" to create a vector of the column indexes which is used to subset the data. Two data fields are added to the observations data: 1) "subject" from subject_train.txt and subject_test.txt and 2) "activity" from the y_train.txt and y_test.txt files.
3. Add descriptive activity names: Descriptive names were defined as a character vector and substituted for the integer activity values in the source data.
4. Use descriptive variable names: The variable names were processed to make them all lower case and to remove problematic characters {( ) , -} substituting {_} where necessary for understandability.

The "tidy.data" data frame for step 5 uses the ddply command on combined.data to execute the mean 
function on each column for each subject/activity pair. The write.table command creates the .txt file
for the assignment submission.

#3. Output Data
## Parts 1-4 (combined.data)

### Observation Variables
The following variables are all integer values of the mean or standard deviation (std) of the observation values indicated.

 [1] "tbodyacc_mean_x"                     "tbodyacc_mean_y"                    
 [3] "tbodyacc_mean_z"                     "tbodyacc_std_x"                     
 [5] "tbodyacc_std_y"                      "tbodyacc_std_z"                     
 [7] "tgravityacc_mean_x"                  "tgravityacc_mean_y"                 
 [9] "tgravityacc_mean_z"                  "tgravityacc_std_x"                  
[11] "tgravityacc_std_y"                   "tgravityacc_std_z"                  
[13] "tbodyaccjerk_mean_x"                 "tbodyaccjerk_mean_y"                
[15] "tbodyaccjerk_mean_z"                 "tbodyaccjerk_std_x"                 
[17] "tbodyaccjerk_std_y"                  "tbodyaccjerk_std_z"                 
[19] "tbodygyro_mean_x"                    "tbodygyro_mean_y"                   
[21] "tbodygyro_mean_z"                    "tbodygyro_std_x"                    
[23] "tbodygyro_std_y"                     "tbodygyro_std_z"                    
[25] "tbodygyrojerk_mean_x"                "tbodygyrojerk_mean_y"               
[27] "tbodygyrojerk_mean_z"                "tbodygyrojerk_std_x"                
[29] "tbodygyrojerk_std_y"                 "tbodygyrojerk_std_z"                
[31] "tbodyaccmag_mean"                    "tbodyaccmag_std"                    
[33] "tgravityaccmag_mean"                 "tgravityaccmag_std"                 
[35] "tbodyaccjerkmag_mean"                "tbodyaccjerkmag_std"                
[37] "tbodygyromag_mean"                   "tbodygyromag_std"                   
[39] "tbodygyrojerkmag_mean"               "tbodygyrojerkmag_std"               
[41] "fbodyacc_mean_x"                     "fbodyacc_mean_y"                    
[43] "fbodyacc_mean_z"                     "fbodyacc_std_x"                     
[45] "fbodyacc_std_y"                      "fbodyacc_std_z"                     
[47] "fbodyacc_meanfreq_x"                 "fbodyacc_meanfreq_y"                
[49] "fbodyacc_meanfreq_z"                 "fbodyaccjerk_mean_x"                
[51] "fbodyaccjerk_mean_y"                 "fbodyaccjerk_mean_z"                
[53] "fbodyaccjerk_std_x"                  "fbodyaccjerk_std_y"                 
[55] "fbodyaccjerk_std_z"                  "fbodyaccjerk_meanfreq_x"            
[57] "fbodyaccjerk_meanfreq_y"             "fbodyaccjerk_meanfreq_z"            
[59] "fbodygyro_mean_x"                    "fbodygyro_mean_y"                   
[61] "fbodygyro_mean_z"                    "fbodygyro_std_x"                    
[63] "fbodygyro_std_y"                     "fbodygyro_std_z"                    
[65] "fbodygyro_meanfreq_x"                "fbodygyro_meanfreq_y"               
[67] "fbodygyro_meanfreq_z"                "fbodyaccmag_mean"                   
[69] "fbodyaccmag_std"                     "fbodyaccmag_meanfreq"               
[71] "fbodybodyaccjerkmag_mean"            "fbodybodyaccjerkmag_std"            
[73] "fbodybodyaccjerkmag_meanfreq"        "fbodybodygyromag_mean"              
[75] "fbodybodygyromag_std"                "fbodybodygyromag_meanfreq"          
[77] "fbodybodygyrojerkmag_mean"           "fbodybodygyrojerkmag_std"           
[79] "fbodybodygyrojerkmag_meanfreq"       "angle_tbodyaccmean_gravity"         
[81] "angle_tbodyaccjerkmean_gravitymean"  "angle_tbodygyromean_gravitymean"    
[83] "angle_tbodygyrojerkmean_gravitymean" "angle_x_gravitymean"                
[85] "angle_y_gravitymean"                 "angle_z_gravitymean"

### Description Variables
The "subject" variable is an integer between 1 and 30 indicating the subject of the observation.                          

The "activity" variable is a character value with one of six values:walking, walkingupstairs, walkingdownstairs, sitting, standing, laying

## Part 5 (tidy.data)
"subject" and "activity" are the same as defined above. There is one observation for each combination of subject and activity.
The observation variables are the same as for Part 1-4 above. However the values for each variable is mean of each of the observation variables for each subject/activity combination.