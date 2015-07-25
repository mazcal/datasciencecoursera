# Merges the training and the test sets to create one data set.
## read the training and test set files
train_y <- read.csv('UCI HAR Dataset//train//y_train.txt', sep="", header=FALSE)
train_s <- read.csv('UCI HAR Dataset//train//subject_train.txt', sep="", header=FALSE)
train_x <- read.csv('UCI HAR Dataset//train//X_train.txt', sep="", header=FALSE)
test_y <- read.csv('UCI HAR Dataset//test//y_test.txt', sep="", header=FALSE)
test_s <- read.csv('UCI HAR Dataset//test//subject_test.txt', sep="", header=FALSE)
test_x <- read.csv('UCI HAR Dataset//test//X_test.txt', sep="", header=FALSE)
## Merge tables containing the same type of data
merged_y <- rbind(train_y, test_y)
merged_s <- rbind(train_s, test_s)
merged_x <- rbind(train_x, test_x)
## Combine the columns from the three sets
dataset <- cbind(merged_y, merged_s, merged_x)

# Appropriately labels the data set with descriptive variable names. 
features <- read.csv('UCI HAR Dataset//features.txt', sep="", stringsAsFactors=FALSE, header=FALSE)
column_names <- append(c('activity', 'subject'), features[,2])
names(dataset) <- column_names

# Extracts only the measurements on the mean and standard deviation for each measurement. 
relevant_columns <- relevant_columns <- c( c(1,2), grep("mean\\(\\)|std\\(\\)", column_names) )
subset_data <- dataset[, relevant_columns]

# Uses descriptive activity names to name the activities in the data set
activities <- read.csv('UCI HAR Dataset//activity_labels.txt', sep="", stringsAsFactors=F, header=F)
subset_data$activity <- activities[subset_data$activity, 2]

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Aggregate based on the unique combinations of activity + subject columns
tidy <- aggregate(. ~ activity + subject, subset_data, FUN=mean)
write.table(tidy, file='tidy.txt', row.name=FALSE)