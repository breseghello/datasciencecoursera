*** Getting and Cleaning Data Course Project ***

Download and unzip the dataset

Extracts only the measurements on the mean and standard deviation, using the grep() function and 
regular expressions ".*mean.*" and ".*std.*" on the <features.txt> file content.

Loads filtered data sets (only mean and sd) using the matches of the grep() function. 
Does it for train and test data.

Merges the training and the test sets to create one data set, using the cbind() function.

Labels the data set with descriptive variable names, using the names from the <features.txt> file.

Creates a second, independent tidy data set, with the average of each variable for each activity and each subject,
using the dplyr package for grouping data by subject and activity.

