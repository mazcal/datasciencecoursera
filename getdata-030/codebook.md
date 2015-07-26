# run_analysis.R, project codebook for Getting and Cleaning Data

the code in run_analysis.R will perform the following actions on the data set, which should be extracted to the same working directory.

* Read file contents as CSV from the X, Y and Subject files for both the Training and Test sets.
* Merge the sets using cbind and rbind into one coherent table
* Load the features.txt in order to name columns properly
* Aggregate the mean values for each unique combination of activity and subject

## Column Descriptions

* Activity
** Includes the name of the activity taken (ie. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING)
* Subject
** Identifies the test subject in order to match measurements per test subject
** A number between 1 and 30
* Additional columns
** Further columns document axial movements
** Format of column names is <Motion Type>-<mean()|std()>[-X|-Y|-Z]
** Motion types include
*** tBodyAcc (accelerometer measurement)
*** tGravityAcc (accelerometer measurement)
*** tBodyAccJerk (accelerometer measurement)
*** tBodyGyro (gyroscope measurement)
*** tBodyGyroJerk (gyroscope measurement)
*** tBodyAccMag (accelerometer measurement)
*** tGravityAccMag (accelerometer measurement)
*** tBodyAccJerkMag (accelerometer measurement)
*** tBodyGyroMag (gyroscope measurement)
*** tBodyGyroJerkMag (gyroscope measurement)
*** fBodyAcc (accelerometer measurement)
*** fBodyAccJerk (accelerometer measurement)
*** fBodyGyro (gyroscope measurement)
*** fBodyAccMag (accelerometer measurement)
*** fBodyAccJerkMag (accelerometer measurement)
*** fBodyGyroMag (gyroscope measurement)
*** fBodyGyroJerkMag (gyroscope measurement)
** "mean()" or "std()" as the suffix denote whether the colum includes mean or standard deviation for all measurements taken by subject in this motion type
** X, Y or Z denote the axis measured by relevant (non-gravity) measurements