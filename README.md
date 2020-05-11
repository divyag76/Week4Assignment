### Course - Getting and Cleaning Data Week 4 Project

Task for the project:
You should create one R script called run_analysis.R that does the following.
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each  subject.

### Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Steps for this project:
Write a script "run_analysis.R" :
- Download the zip file and extract all the files in your working directory
- Load the Training and Testing data files (subject, activities and features) 
- Combine the Traing and Test data files 
- Find the aggregates (mean and standard deviation)
- Get the tidy dataset with appropriate label names
