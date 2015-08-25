## 1. Download and unzip the data file, put in a folder called "Project"
if (!file.exists("./Project")) {dir.create("./Project")}
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./Project/Data.zip")
unzip(zipfile = "./Project/Data.zip", exdir = "./Project")  
# In the Project folder there is the unzipped file folder "UCI HAR Dataset", which contains all the datasets

## 2-1. Load the training and the test datasets
subject_train <- read.table("./Project/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./Project/UCI HAR Dataset/train/y_train.txt")
x_train <- read.table("./Project/UCI HAR Dataset/train/X_train.txt")

subject_test <- read.table("./Project/UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./Project/UCI HAR Dataset/test/y_test.txt")
x_test <- read.table("./Project/UCI HAR Dataset/test/X_test.txt")

## 2-2. Merge the training and the test datasets 
mergeX <- rbind(x_train,x_test)
mergeY <- rbind(y_train,y_test) 
mergeSubject <- rbind(subject_train,subject_test)


## 3. Extract the columns about the mean and standard deviation measurements 
features <- read.table("./Project/UCI HAR Dataset/features.txt", stringsAsFactors = F) 
#the features dataset records the names of all the measurement variables

#extract those columns with "mean" or "std" in their names (including meanfreq)
mean_or_std_f <- grep("mean|std", features[,2]) 
mergedX_subset <- mergeX[,mean_or_std_f]
WantedData <- cbind(mergeSubject,mergeY,mergedX_subset) 
#WantedData is a complete dataset of the extracted measurements, subject IDs and activity IDs 

## 4.Use descriptive activity names to name the activities in the dataset
activity <- read.table("./Project/UCI HAR Dataset/activity_labels.txt")
WantedData[,2] <- activity[WantedData[,2],2]

## 5. Label the dataset with readable and descriptive names 
Wantedfeatures.name <- features[mean_or_std_f,2] #create a vector containing the names of the selected features/measurements
# clean up the feature names,e.g. remove (), replace Mag with Magnitude, replace BodyBody with Body, and so on.
Wantedfeatures.name <- gsub("\\()","",Wantedfeatures.name)
Wantedfeatures.name <- gsub("\\-","",Wantedfeatures.name)
Wantedfeatures.name <- gsub("mean","Mean",Wantedfeatures.name)
Wantedfeatures.name <- gsub("std","Std",Wantedfeatures.name)
Wantedfeatures.name <- gsub("BodyBody","Body", Wantedfeatures.name)
Wantedfeatures.name <- gsub("Mag","Magnitude", Wantedfeatures.name)
Wantedfeatures.name <- gsub("Acc","Accelerometer", Wantedfeatures.name)
Wantedfeatures.name <- gsub("Gyro","Gyroscope", Wantedfeatures.name)
# add the descriptive names to all the columns
names(WantedData) <- c("SubjectID","Activity", Wantedfeatures.name)

## 6. Create a second, independent tidy dataset 
## with the average of each variable for each activity and each subject.
library(plyr)
WantedData$SubjectID <- as.factor(WantedData$SubjectID) #turn SubjectID into factor class
tidydata <- aggregate(.~SubjectID + Activity, WantedData, mean) #summarize the average of each variable for each activity and subject
tidydata <- tidydata[order(tidydata$SubjectID,tidydata$Activity),] # sort the data
write.table(tidydata, file = "./Project/tidydata.txt", row.names = F, quote = F)

