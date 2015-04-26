# The Code Book for run_analysis.R 
## A coursera "getting and cleaning data" assessment

This is data from a study using mobile phones to investigate peoples activity

The following steps are taken by the script to clean data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

When unzipped the file contains:
activity_labels.txt - a text file with the key to the labels used
features_info.txt - a text file giving information on the information in the "features.txt" file.
features.txt - a list of the headers for the data in the "X" data tables
README.txt - a file describing the data and its collection

and the following folders:
test
train

Each of these contains an "X" table with the data and a "y" file with the activity key for each column.
They also contain a folder called "inertial signals" which contains the data from which the "X" and "y" data are made up.

The script should be run in the first directory of the unzipped file.

###Merge the training and test sets to create one data set

* read in the "test" data
* read in the "train" data
* bind the x data into a single table
* bind the x data into a single table
* bind the summary data into a single table

### Extract only the measurements on the mean and standard deviation for each measurement

* read in "features.txt"
* get the headers containing the mean or std (using grep here, should be more R like)
* subset x data with required columns
* name x columns 

### Use descriptive activity names to name the activities in the data set

* read in "activity_labels.txt"
* update y values with correct activity names

### Appropriately label the data set with descriptive variable names

* correct the column names
* bind the data set in to one single table

### Create a second, independent tidy data set with the average of each variable for each activity and each subject

* create an averages table using ddply
* write out a text file - text file is called "averages.txt" in the current working directory

