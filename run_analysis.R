# Prerequisites

# The data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip
# must have been downloaded and unzipped into the working directory
# None of the unzipped files or folders should be moved, renamed or deleted

# The library "plyr" must be installed
library(plyr)

# Define a few variables to be used below
colActivityId <- "activityId"
colActivity <- "activity"
colSubjectId <- "subjectId"
greplColumns <- paste("mean", "std", colSubjectId, colActivityId, sep = "|")

# 1. Merge the training and the test sets to create one data set.

# Read the activity labels & feactures
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
# Read the training data
trainSubject <-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
# Read the test data
testSubject <-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testX <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

# Assign column names
colnames(activityLabels) <- c(colActivityId, colActivity)
colnames(trainSubject) <- colSubjectId
colnames(trainX) <- features[,2]
colnames(trainY) <- colActivityId
colnames(testSubject) <- colSubjectId
colnames(testX) <- features[,2]
colnames(testY) <- colActivityId

# Merge the training data
trainMerge <- cbind(trainY, trainSubject, trainX)
# Merge the test Data
testMerge <- cbind(testY, testSubject, testX)
# Merge the training & test data
mergedData <- rbind(trainMerge, testMerge)

# 2. Extract only the measurements on the mean and standard deviation for each measurement
# Keep only the mean, std, subject & activity data
mergedMeanStd <- mergedData[,grepl(greplColumns, colnames(mergedData))]

# 3. Use descriptive activity names to name the activities in the data set
# Join the mergedMeanStd & activityLabels to get the activity descrptions, and drop activityId
mergedMeanStd <- join(mergedMeanStd, activityLabels, by = colActivityId, match = "first")[,-1]

# 4. Appropriately label the data set with descriptive variable names.
# Names were applied to columns from the features table back in step 1
# Tidy up the names by removing dashes & brackets and capitalising Mean & Std
names(mergedMeanStd) <- gsub("[-()]", "", names(mergedMeanStd))
names(mergedMeanStd) <- gsub("mean", "Mean", names(mergedMeanStd))
names(mergedMeanStd) <- gsub("std", "Std", names(mergedMeanStd))

# 5. From the data in step 4, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
tidydata <- ddply(mergedMeanStd, c(colSubjectId, colActivity), numcolwise(mean))

# Write the tidy data set to a text file
write.table(tidydata, file="tidydata.txt", row.names = FALSE)