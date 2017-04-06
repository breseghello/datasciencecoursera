# *** Getting and Cleaning Data Course Project ***

# Download and unzip the dataset

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "galaxy.zip")
unzip("galaxy.zip") 

# Extracts only the measurements on the mean and standard deviation

features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])
mean_sd <- grep(".*mean.*|.*std.*", features[,2])
mean_sd_names <- features[mean_sd,2]
mean_sd_names <- gsub('[-()]', '', mean_sd.names)

# Loads filtered data sets (only mean and sd) 

train <- read.table("UCI HAR Dataset/train/X_train.txt")[mean_sd]
trainAct <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubj, trainAct, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[mean_sd]
testAct <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubj, testAct, test)

# merges the training and the test sets to create one data set.

allData <- rbind(train, test)

# Appropriately labels the data set with descriptive variable names.

colnames(allData) <- c("subject", "activity", mean_sd_names)

# From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.

library(dplyr)
TidyData <- tbl_df(allData)
TidyData <- group_by(TidyData, subject, activity)
TidyMeans <- summarise_each(TidyData, funs(mean))
write.table(TidyMeans, "tidy_means.csv", sep = ",", row.names = FALSE, quote = FALSE)
