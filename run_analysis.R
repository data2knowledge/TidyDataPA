## download and unzip HCI Data
downloadFileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(downloadFileURL,"UCI HAR Dataset.zip")
unzip("UCI HAR DataSet.zip",exdir = "HCIData")

## Prepare the file names for Traning,Test,Subject and Activity
trainDataFile<-"./HCIData/UCI HAR Dataset/train/X_train.txt"
trainLabelFile<-"./HCIData/UCI HAR Dataset/train/y_train.txt"
trainSubject<-"./HCIData/UCI HAR Dataset/train/subject_train.txt"
testDataFile<-"./HCIData/UCI HAR Dataset/test/X_test.txt"
testLabelFile<-"./HCIData/UCI HAR Dataset/test/y_test.txt"
testSubject<-"./HCIData/UCI HAR Dataset/test/subject_test.txt"
features<-"./HCIData/UCI HAR Dataset/features.txt"
activityLabels<-"./HCIData/UCI HAR Dataset/activity_labels.txt"

## Load all data set for Traning,Test,Subject and Activity
trainDataSet<-read.table(trainDataFile,colClasses=c("numeric","character"), header = FALSE,sep="",fill = TRUE)
trainLabelSet<-read.table(trainLabelFile,colClasses="character", header = FALSE,sep="",fill = TRUE)
trainSubjectDataSet<-read.table(trainSubject,colClasses="character", header = FALSE,sep="",fill = TRUE)
testDataSet<-read.table(testDataFile,colClasses=c("numeric","character"), header = FALSE,sep="",fill = TRUE)
testLabelSet<-read.table(testLabelFile,colClasses="character", header = FALSE,sep="",fill = TRUE)
testSubjectDataSet<-read.table(testSubject,colClasses="character", header = FALSE,sep="",fill = TRUE)
activityLabelsDataSet<-read.table(activityLabels,colClasses=c("numeric","character"), header = FALSE,sep="",fill = TRUE)
featuresDataSet<-read.table(features,colClasses=c("numeric","character"), header = FALSE,sep="",fill = TRUE)

## Select column names for only the measurements on the mean and standard deviation to use later
allFeatures<-featuresDataSet$V2
allRequiredFeatures<-allFeatures[grepl("mean|std",allFeatures,ignore.case = TRUE)]

## Change activity name to Training Labels and Test Labels by using factor
newActivityFac<-factor(activityLabelsDataSet[[2]])

oldTrainFac<-factor(trainLabelSet[[1]])
renTrainFac<-factor(oldTrainFac,labels=newActivityFac)
trainLabelSet<-as.data.frame(renTrainFac)

oldTestFac<-factor(testLabelSet[[1]])
renTestFac<-factor(oldTestFac,labels=newActivityFac)
testLabelSet<-as.data.frame(renTestFac)

## Add variable names to Traning,Test,Subject and Activity  in lower case
allFeatures<-featuresDataSet$V2
colnames(trainDataSet)<-tolower(allFeatures)
colnames(testDataSet)<-tolower(allFeatures)
colnames(trainSubjectDataSet)<-"subject"
colnames(testSubjectDataSet)<-"subject"
colnames(trainLabelSet)<-"activity"
colnames(testLabelSet)<-"activity"

## Extracts the measurements data only on the mean and standard deviation for Training
requiredTrainDateSet<-trainDataSet[ ,which(names(trainDataSet) %in% tolower(allRequiredFeatures))]
## Bind the Subject Data Set Training Data Set as another column
newTrainDataSet<-cbind(requiredTrainDateSet,trainSubjectDataSet)
## Bind the Activity Data Set to Training Data Set as another column
finalTrainDataSet<-cbind(newTrainDataSet,trainLabelSet)

## Extracts the measurements data only on the mean and standard deviation for Test
requiredTestDateSet<-testDataSet[ ,which(names(testDataSet) %in% tolower(allRequiredFeatures))]
## Bind the Subject Data Set Training Data Set as another column
newTestDataSet<-cbind(requiredTestDateSet,testSubjectDataSet)
## Bind the Activity Data Set to Training Data Set as another column
finalTestDataSet<-cbind(newTestDataSet,testLabelSet)

## Merges the Training and Test Data Sets to create one data set.
mergedDataSet<-rbind(as.data.frame(finalTrainDataSet),as.data.frame(finalTestDataSet)) 

## set with descriptive variable names by removing some characters
colnames(mergedDataSet)<-gsub("-|\\()","",names(mergedDataSet))

## Creates a second tidy data set with the average of each variable for each activity and each subject
tidyDataSet<- aggregate(mergedDataSet, by=list(mergedDataSet$activity,mergedDataSet$subject),FUN=mean,na.rm=TRUE)

## Write the result to a file to the working directory
write.table(tidyDataSet,file="hci.txt", row.names=FALSE)
