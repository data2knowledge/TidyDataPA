Human Activity Recognition (Using Smartphones Data Set)
===========

### The raw data set

The raw data set is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### The tidy data set

To get tidy data set, the raw data is cleand as the followings 

* Load all the data set for Traning,Test,Subject and Activity
* Extract the measurements data only on the mean and standard deviation for Training
* Extract the measurements data only on the mean and standard deviation for Test
* Label activity name to Training Labels and Test Labels by using factor
* Add Subject data set and Activity data set as the new columns in the main data set of Training and Test
* And merge all the data into one set and called "mergedDataSet"
* Add the variable names to Traning and Test
* Add appropriate labels the data set with descriptive variable names. 
* Creates a second tidy data set with the average of each variable for each activity and each subject
* Write the result to a file called "hci.txt" to the working directory

### The code book

The code book (HCI Code Book.pdf) contains the details about tidy data set

* Variable Name
* Type
* Description
* Sample data

### How to use the tidy data set?

* Load run_analysis.R
* Poupulate the tidy data set

### Source Code Usage

Library(run_analysis.R)

head(tidyDataSet,3)

tail(tidyDataSet,3)

head(mergedDataSet,3)

tail(mergedDataSet,3)

