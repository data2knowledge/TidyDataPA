Human Activity Recognition (Using Smartphones Data Set)
===========

### The raw data set

The raw data set is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### The tidy data set

To get tidy data set, the raw data is cleand as the followings 

* Load the data for Traning,Test,Subject and Activity by using read.table command
* Extract the measurement only on the mean and standard deviation for Training data by using grepl command
* Extract the measurement only on the mean and standard deviation for Test data by using grepl command
* Add activity labels to Training Labels and Test Labels by using factor command
* Add Subject and Activity data sets as the new columns in the main data set of Training and Test
* Merge all the data set into one called "mergedDataSet"
* Add appropriate labels to the data set with descriptive variable names. 
* Creates a second tidy data set called "tidyDataSet" with the average of each variable for each activity and each subject
* Write the result to a file called "hci.txt" to the working directory

### The code book

The code book (HCI Code Book.pdf) contains the details about tidy data set

* Variable Name
* Type
* Description
* Sample data

### How to use the tidy data set?

* Load run_analysis.R. 
* The raw data will be downloaded and unzip automatically under the directory called "HCIData"
* Poupulate the tidy data set and do analysis

### Sample

Library(run_analysis.R)

head(tidyDataSet,3)

tail(tidyDataSet,3)

head(mergedDataSet,3)

tail(mergedDataSet,3)

