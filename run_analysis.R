run_analysis <- function() {
  library(plyr)
  library(dplyr)
  #download data sets
  if (!file.exists("UCI HAR Dataset.zip")) {
    fileURL <<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, "UCI HAR Dataset.zip", method = "curl")
  }
  if(!file.exists("UCI HAR Dataset")) {
    unzip("UCI HAR Dataset.zip")
  }
  #load data sets into R
  X_test <<- read.table("UCI HAR Dataset/test/X_test.txt")
  y_test <<- read.table("UCI HAR Dataset/test/y_test.txt")
  subject_test <<- read.table("UCI HAR Dataset/test/subject_test.txt")
  X_train <<- read.table("UCI HAR Dataset/train/X_train.txt")
  y_train <<- read.table("UCI HAR Dataset/train/y_train.txt")
  subject_train <<- read.table("UCI HAR Dataset/train/subject_train.txt")
  features <<- read.table("UCI HAR Dataset/features.txt")
  activity_labels <<- read.table("UCI HAR Dataset/activity_labels.txt")
  #bind data sets
  dataset <<- rbind(X_test, X_train)
  IDactivity <<- rbind(y_test, y_train)
  IDsubject <<- rbind(subject_test, subject_train)
  #extract only the measurements on the mean and std dev for each measurement
  #and label the data set with descriptive variable names
  meansstdfeatures <<- grep("-mean[^F]|-std", features[,2]) #excluding meanFreq
  dataset2 <<- dataset[,meansstdfeatures]
  names(dataset2) <<- features[meansstdfeatures, 2]
  #use descriptive activity names to name the activities in the data set
  Activity <<- join(IDactivity, activity_labels)
  activity_labeled <<- data.frame(Activity[,2])
  names(activity_labeled) <<- "ActivityName"
  #label IDsubject data set 
  names(IDsubject) <<- "SubjectID"
  #bind data sets 
  finaldataset <<- cbind(IDsubject, activity_labeled, dataset2)
  #average of each variable for each activity and each subject
  library(data.table)
  finaldatasetdatatable <<- data.table(finaldataset)
  means <<- finaldatasetdatatable[,lapply(.SD,mean), by = c("SubjectID", "ActivityName")]
  write.table(means, "tidy.txt", row.names = FALSE)
  }