gettingandcleaningdataproject
=============================

Course Project for Coursera Getting and Cleaning Data Class

You should create one R script called run_analysis.R that does the following. 

Merges the training and the test sets to create one data set.
  - x_train.txt, y_train.txt, and subject_train.txt files were merged to one.  The same was done with test files, and these were then merged into one giant data table.

Extracts only the measurements on the mean and standard deviation for each measurement. 
  - searched the column names to subject the one merged file into another dataset that included only these variables

Uses descriptive activity names to name the activities in the data set
  Changed the codes (1-5) to descriptive labels (Walking, Standing, etc) for the second column.

Appropriately labels the data set with descriptive variable names. 
  - eliminated some duplicate wording, changed all letters to lower case, and elminated some dashes.


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  - melted the dataframe and recast it to only include averages for each variable
