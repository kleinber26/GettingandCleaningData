#Getting and Cleaning Data Course Project 
##Human Activity Recognition Using Smartphones 

##Dataset 

run_analysis.R downloads the Human Activity Recognition Using Smartphones dataset from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Script Functions

* Download and unzip dataset
* Load X_test, y_test, subject_test, X_train, y_train, subject_train, features and activity_label files into R
* Bind X_test and X_train datasets, y_test and y_train datasets and subject_test and subject_train datasets
* Extract only the measurements on the mean, excluding meanFreq, and std dev for each measurement
* Label the dataset with descriptive variable names from the features file 
* Join bound y_test and y_train datasets with activity_labels file and name activities in dataset
* Name column of bound subject_test and subject_train datasets
* Bind subject, activity and variable data 
* Compute average of each variable for each subject and activity pair
* Create txt file of tidy data set 

In summary, run_analysis.R creates a tidy data set, "tidy.txt", with the mean value of each variable for each subject and activity pair. 

##Notes 
  