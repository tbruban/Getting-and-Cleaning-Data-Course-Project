#load dependency libraries
library(plyr)

#set path to local working dir where UCI HAR dataset files are downloaded and unzipped
setwd('C:/Users/User/Desktop/Data Science/Module3/Assessment/UCI HAR Dataset')

#Reading the data from files and loading into data tables
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Step 1: Merges the training and the test sets to create one data set.
x_train_data <- rbind(x_train, x_test)
y_train_data <- rbind(y_train, y_test)

# Merges both subject_train and subject_test into one data set.
subject_data <- rbind(subject_train, subject_test)

# Step 2:Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
#str(features)
#Retrieve columns with name mean(),std()
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset requested columns
x_train_data <- x_train_data[, mean_and_std_features]

# update the column names
names(x_train_data) <- features[mean_and_std_features, 2]

# Step 3 : Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_train_data[, 1] <- activities[y_train_data[, 1], 2]

#Update the column name for y data set
names(y_train_data) <- "activity"

# Step 4 : Appropriately label the data set with descriptive variable names

#change to appropriate column name
names(subject_data) <- "subject"

# Merge all the data in a single data set
all_data <- cbind(x_train_data, y_train_data, subject_data)

# Step 5 : Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
#str(all_data)
#Total of 68 columns,excluding the last two activity and subject columns and calculating the mean of columns 1 to 66
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)

