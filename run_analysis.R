library(plyr)

# Step 1
# Merge the training and test sets to create one data set

#reading in the "test" data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#reading in the "train" data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# creating an 'x' data set
x_data <- rbind(x_train, x_test)

# creating a 'y' data set
y_data <- rbind(y_train, y_test)

# creating a 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# subsetting the desired columns
x_data <- x_data[, mean_and_std]

# correcting the column names
names(x_data) <- features[mean_and_std, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# updating the values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# and then correct column name
names(y_data) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names

# correct column name
names(subject_data) <- "subject"

# binding all the data into a single data set
all_data <- cbind(x_data, y_data, subject_data)

# Step 5
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

averages <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(averages, "averages.txt", row.name=FALSE)