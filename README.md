# Getting and Cleaning Data Course Project

## Project Overview

This project makes use of the following data set:
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The object of the project is to create one R script called run_analysis.R that does the following:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script Overview

The script run_analysis.R uses the plyr package which must be installed before running the script.

Before the script can be run, the zip file downloaded from the link above must be extracted into the working directory. The script must be run from the working directory.

The script works through the above 5 steps sequencially:
* It begins by using read.table to read the data files into a group of data frames and then merges them into a single data frame
* It subsets the data frame using grepl to retain only columns containing mean and standard deviation
* It joins the activity labels to the data frame by matching activityId to bring in the activity description for each row, and drops the activityId
* Having applied the variable names from the features.txt file as the column names it then cleans these up by removing dashes and brackets
* Finally, using the plyr library it combines the fuctions ddply & numcolwise to split the data frame by subject & activity and take the mean for each column
* The resulting tidy data frame is written to a text file called tidydata.txt
