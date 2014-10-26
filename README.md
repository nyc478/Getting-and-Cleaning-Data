Getting-and-Cleaning-Data
=========================

Getting and Cleaning Data coursera course assignment

## assignment.R

The cleanup script (assignment.R) does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the script
From R console run the script as source("assignment.R")

## Steps to run the script

1. Download the data source and put into a folder on your working directory. 
2. Extract the zip file in your working directory.
2. Put ```assignment.R``` in the parent folder of your working directory
3. Run ```source("assignment.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.

## Dependencies

The function depends on package ```reshape2```. If  ```reshape2``` is not install please install it by install.package("reshape2")
