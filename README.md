Human Activity Recognition Using Smartphones Data Set 
===========

### The raw data

The raw data is download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### The tidy data set

To get tidy data set, the raw data is clean as the following 

* Load all the data set for Traning,Test,Subject and Activity
* Extracts the measurements data only on the mean and standard deviation for Training
* Extracts the measurements data only on the mean and standard deviation for Test
* Change Activity name to Training Labels and Test Labels by using factor
* Add Subject and Activity  as the columns in the main data set of Training and Test
* And merge all the data into one set
* Add the variable names to Traning and Test
* Add appropriate labels the data set with descriptive variable names. 

### The code book

The code mentions details about the tidy data set

* Variable Name
* Type
* Description
* Sample data

### How to use the tidy data set?

* Load run_analysis.R
* Type tidyDataSet or mergedDataSet

### EXAMPLE:

Library(run_analysis.R)

head(tidyDataSet,3)
tail(tidyDataSet,3)

head(mergedDataSet,3)
tail(mergedDataSet,3)

