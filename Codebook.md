Data Source:

The source of this data is collected from the Accelerometers from Samsung Galaxy S
Smartphone. The link for this data set and explanation for the project
is available in this link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The original dataset information is below:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments are done with a group of 30 volunteers with an age range of 19-48 years and includes a set of 6 activities - Walking, Walking Upstairs, Walking Downstairs, Sitting , Standing  and Laying while wearing a smarphone on the waist. The dataset is randomly partitioned into training and testing with the ratio of 70:30. 

Data Files Used in the assignmet

The dataset includes the following files:
- README.txt 
  gives the general information on the assignment
- features_info.txt 
  gives the variable information in the dataset
- features.txt
  Lists all the features in dataset
 - activity_labels.txt 
    Provides the link between the class labels and activity names
 - X_train.txt 
    Training set 
 - y_train.txt 
    Training names
 - subject_train.txt 
    Each row identifies one experiment by one subject
 - test_X.txt 
    Testing dataset
 - test_y.txt 
    Testing labels
 - subject_test.txt 
    Testing data for subjects
 
 Files not used in this assignment are under the "Inertial Signals" folder.
 
 ###Steps in the run_analysis.R script:
 - Merge the training and test datasets to create one dataset
 - Extract the mean and standard deviation measurements for each measurement
 - Renamed the columns to use descriptive names for activities
 - Create a second, independent tidy data set


 
   

