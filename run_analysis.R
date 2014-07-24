library(plyr)

# Create the "UCI HAR Dataset" directory, if it does not exist

if(!file.exists("UCI HAR Dataset"))
{
        dir.create("UCI HAR Dataset")
}

# Dowanload the data (the zip file)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "getdata_projectfiles_UCI HAR Dataset.zip", mode = "wb")


# Extract the data files for the train and test
unzip("getdata_projectfiles_UCI HAR Dataset.zip")


# Read activity labels
activities <- read.table("UCI HAR Dataset\\activity_labels.txt")
names(activities) <- c("ActivityId", "Activity")

# Prepare "Train" data (start) ############################################################################

subject <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
names(subject) <- c("Subject")
nrows <- nrow(subject) # Number of rows in the training data

activity <- read.table("UCI HAR Dataset\\train\\y_train.txt")
names(activity) <- c("ActivityId")
measurements <- read.table("UCI HAR Dataset\\train\\x_train.txt")

# Use only the six first columns from the measurments.
# These columns use mean and standard deviation.
# From the total of 561 columns, other columns also use mean and standard deviation,
# however, for the present assignmenet only these six are used:
#       1 tBodyAcc-mean()-X
#       2 tBodyAcc-mean()-Y
#       3 tBodyAcc-mean()-Z
#       4 tBodyAcc-std()-X
#       5 tBodyAcc-std()-Y
#       6 tBodyAcc-std()-Z

# The features variable uses only the six columns mentioned above
features <- measurements[, 1:6]
names(features) <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z")

# Put labels on the activities using the function "join", the result is stores in the temp1 variable
temp1 <- join(activity, activities)
dataTrain <- cbind(subject, temp1, features, Type=rep("Train", nrows))

# Prepare "Train" data (end) ############################################################################


# Prepare "Test" data (start) ############################################################################

subject <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
names(subject) <- c("Subject")
nrows <- nrow(subject) # Number of rows in the training data

activity <- read.table("UCI HAR Dataset\\test\\y_test.txt")
names(activity) <- c("ActivityId")
measurements <- read.table("UCI HAR Dataset\\test\\x_test.txt")

# Use only the six first columns from the measurments.
# These columns use mean and standard deviation.
# From the total of 561 columns, other columns also use mean and standard deviation,
# however, for the present assignmenet only these six are used:
#       1 tBodyAcc-mean()-X
#       2 tBodyAcc-mean()-Y
#       3 tBodyAcc-mean()-Z
#       4 tBodyAcc-std()-X
#       5 tBodyAcc-std()-Y
#       6 tBodyAcc-std()-Z

# The features variable uses only the six columns mentioned above
features <- measurements[, 1:6]
names(features) <- c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z")

# Put labels on the activities using the function "join", the result is stores in the temp1 variable
temp1 <- join(activity, activities)
dataTest <- cbind(subject, temp1, features, Type=rep("Test", nrows))

# Prepare "Test" data (end) ############################################################################

# Save Train and Test data in one single file, called data.txt

# Save the table
data <- rbind(dataTrain, dataTest)
write.table(data, "data1.txt", row.names=FALSE)


# 5     Creates a second, independent tidy data set with the average of each variable for each activity and each subject
data <- aggregate(data[, 4:9], by=list(data$Subject, data$Activity), mean)
names(data) <- c("Subject", "Activity", names(data)[3:ncol(data)])
write.table(data, "data2.txt", row.names=FALSE)

# read the table
data <- read.table("data1.txt", header=TRUE)

