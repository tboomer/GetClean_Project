# This script performs the transformations required for the Getting and
# Cleaning Data course. See ProjectCodeBook.md for details.
# The R working directory containing the script must also contain the
# file folder "UCIHARDataset" containing the extracted source files.
# On my local machine this is accomplished with the following Command:
# setwd("./Personal/DataScience-Coursera/GettingAndCleaningData/CourseProject")

# Read source data files into data frames
xtrain <- read.table("./UCIHARDataset/train/X_train.txt", header = FALSE)
xtest <- read.table("./UCIHARDataset/test/X_test.txt", header = FALSE)
ytrain <- read.table("./UCIHARDataset/train/y_train.txt", header = FALSE)
ytest <- read.table("./UCIHARDataset/test/y_test.txt", header = FALSE)
trainsubject <- read.table("./UCIHARDataset/train/subject_train.txt")
testsubject <- read.table("./UCIHARDataset/test/subject_test.txt")
varnames <- read.table("./UCIHARDataset/features.txt", 
                       stringsAsFactors = FALSE)

# Steps 1-4: Restructure source data and add activity and subject variables
combined.data <- rbind(xtrain, xtest)     #Merge data sets
columns <- grep("[Mm]ean|std", varnames$V2)  #Identify mean/std columns
combined.data <- combined.data[ , columns]#Extract mean and std columns
combined.data$subject <- c(trainsubject$V1, testsubject$V1) #Add subject var
combined.data$activity <- c(ytrain$V1, ytest$V1) #Add activity variable
activityname <- c("walking", "walkingupstairs","walkingdownstairs",
                  "sitting","standing","laying")
combined.data$activity <- activityname[combined.data$activity] 
      #Replace integer values of activity with descriptive activity names
cleannames <- gsub("\\()|\\)","",tolower(varnames$V2[columns]))
cleannames <- gsub("\\(|\\,|\\-", "_", cleannames)   #Simplify column names
names(combined.data) <- c(cleannames, "subject", "activity")

#Step 5: Summarize data as mean by subject and activity
library(plyr)
tidy.data <- ddply(combined.data, c("subject", "activity"), 
                   colwise(mean, is.numeric))
write.table(tidy.data, "step5.txt", row.name = FALSE)