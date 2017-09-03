# Getting and Cleaning Data Course Project Code Book

## Script run_analysis.R

### Column headings
Character vectors used in the script to reduce errors from retyping the same "string" multiple times. Also makes it easier to change column names if required.
* colActivityId - used in activityLabels, trainY & testY data fames
* colActivity - used in activityLabels
* colSubjectId - used in trainSubject & testSubject data frames
* greplColumns - contains the grepl parameter to determine which columns are required

### Data Frames - input
Files from the downloaded data set and read into the following data frames
* **activityLabels** - data from "activity_labels.txt"
* **features** - data from "features.txt"
* **trainSubject** - data from "subject_train.txt"
* **trainX** - data from "X_train.txt"
* **trainY** - data from "y_train.txt"
* **testSubject** - data from "subject_test.txt"
* **testX** -  data from "X_test.txt"
* **testY** - data from "y_test.txt"

### Data Frames - working
The following data frames are created and used by the script 
* **trainMerge** - created by combining **trainY**, **trainSubject** & **trainX**
* **testMerge** - created by combining **testY**, **testSubject** & **testX**
* **mergedData** - created by combining **trainMerge** & **testMerge**, this is all the data for all activities & subjects
* **mergedMeanStd** - created from **mergedData** using grepl to retain only the required columns (mean and standard deviation for each measurement)
* **tidydata** - the final output data (see below)

## Result - tidyData Data Frame
The **tidyData** data frame contains data from **mergedMeanStd** summarised (averaged) by subject and activity.  

The first 2 columns are the key columns:
* **subjectId** - the subjects identifier (a number between 1 and 30)
* **activity** - the activity description (there are 6 activities)

The remaining columns contain the mean of the measurements for that variable for the subject & activity.  
From the data set readme.txt file, the data comes from:
* Accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
* The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).
* The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
* The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
* Fast Fourier Transform (FFT) was applied to some of these signals (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag).
* The 't' prefix denotes time domain signals.
* The 'f' prefix indicates frequency domain signals.
* The suffix '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Below is the full list of columns. Using the information above regarding measurements and naming conventions their content can derived.  
Note that dashes have been stripped from the colum names in the tidy data set, therefore suffix -X is now just X etc.
1. subjectId
2. activity
3. tBodyAccMeanX
4. tBodyAccMeanY
5. tBodyAccMeanZ
6. tBodyAccStdX
7. tBodyAccStdY
8. tBodyAccStdZ
9. tGravityAccMeanX
10. tGravityAccMeanY
11. tGravityAccMeanZ
12. tGravityAccStdX
13. tGravityAccStdY
14. tGravityAccStdZ
15. tBodyAccJerkMeanX
16. tBodyAccJerkMeanY
17. tBodyAccJerkMeanZ
18. tBodyAccJerkStdX
19. tBodyAccJerkStdY
20. tBodyAccJerkStdZ
21. tBodyGyroMeanX
22. tBodyGyroMeanY
23. tBodyGyroMeanZ
24. tBodyGyroStdX
25. tBodyGyroStdY
26. tBodyGyroStdZ
27. tBodyGyroJerkMeanX
28. tBodyGyroJerkMeanY
29. tBodyGyroJerkMeanZ
30. tBodyGyroJerkStdX
31. tBodyGyroJerkStdY
32. tBodyGyroJerkStdZ
33. tBodyAccMagMean
34. tBodyAccMagStd
35. tGravityAccMagMean
36. tGravityAccMagStd
37. tBodyAccJerkMagMean
38. tBodyAccJerkMagStd
39. tBodyGyroMagMean
40. tBodyGyroMagStd
41. tBodyGyroJerkMagMean
42. tBodyGyroJerkMagStd
43. fBodyAccMeanX
44. fBodyAccMeanY
45. fBodyAccMeanZ
46. fBodyAccStdX
47. fBodyAccStdY
48. fBodyAccStdZ
49. fBodyAccMeanFreqX
50. fBodyAccMeanFreqY
51. fBodyAccMeanFreqZ
52. fBodyAccJerkMeanX
53. fBodyAccJerkMeanY
54. fBodyAccJerkMeanZ
55. fBodyAccJerkStdX
56. fBodyAccJerkStdY
57. fBodyAccJerkStdZ
58. fBodyAccJerkMeanFreqX
59. fBodyAccJerkMeanFreqY
60. fBodyAccJerkMeanFreqZ
61. fBodyGyroMeanX
62. fBodyGyroMeanY
63. fBodyGyroMeanZ
64. fBodyGyroStdX
65. fBodyGyroStdY
66. fBodyGyroStdZ
67. fBodyGyroMeanFreqX
68. fBodyGyroMeanFreqY
69. fBodyGyroMeanFreqZ
70. fBodyAccMagMean
71. fBodyAccMagStd
72. fBodyAccMagMeanFreq
73. fBodyBodyAccJerkMagMean
74. fBodyBodyAccJerkMagStd
75. fBodyBodyAccJerkMagMeanFreq
76. fBodyBodyGyroMagMean
77. fBodyBodyGyroMagStd
78. fBodyBodyGyroMagMeanFreq
79. fBodyBodyGyroJerkMagMean
80. fBodyBodyGyroJerkMagStd
81. fBodyBodyGyroJerkMagMeanFreq
