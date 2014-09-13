# This script...
# The working directory...
# setwd("./Personal/DataScience-Coursera/GettingAndCleaningData/CourseProject")

# Read source data files into data frames
xtrain <- read.table("./UCIHARDataset/train/X_train.txt", header = FALSE)
xtest <- read.table("./UCIHARDataset/test/X_test.txt", header = FALSE)
ytrain <- read.table("./UCIHARDataset/train/y_train.txt", header = FALSE)
ytest <- read.table("./UCIHARDataset/test/y_test.txt", header = FALSE)
trainsubject <- read.table("./UCIHARDataset/train/subject_train.txt")
testsubject <- read.table("./UCIHARDataset/test/subject_test.txt")
varnames <- read.table("./UCIHARDataset/features.txt", stringsAsFactors = FALSE)

# Restructure source data and add activity and subject variables
combined.data <- rbind(xtrain, xtest)     #Merge training and test data sets
columns <- grep("[Mm]ean|std", varnames$V2)  #Identify columns that are mean or std
combined.data <- combined.data[ , columns]#Extract mean and std columns
combined.data$subject <- c(trainsubject$V1, testsubject$V1) #Add subject variable
combined.data$activity <- c(ytrain$V1, ytest$V1) #Add activity variable
activityname <- c("walking", "walkingupstairs","walkingdownstairs","sitting","standing","laying")
combined.data$activity <- activityname[combined.data$activity] #Replace integer values of activity with descriptive activity names
cleannames <- gsub("\\()|\\)","",tolower(varnames$V2[columns])) #Simplify column names
cleannames <- gsub("\\(|\\,|\\-", "_", cleannames)   #Simplify column names
names(combined.data) <- c(cleannames, "subject", "activity")   #Apply simplified column names
tidydata <- ddply(combined.data, "subject", colwise(mean, is.numeric)) #Step 5: Summarize data as mean by subject
write.table(tidydata, "step5.txt", row.name = FALSE)