#Getting and Cleaning Data Project Description
This project creates an R script that collects, processes, cleans a raw dataset, and produces tidy dataset that can be used for later analysis.

#Study Design and Data Processing
##Data source
The data for this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description about the original data can be obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for this project was downloaded from the course website : 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Notes on the original (raw) data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The raw dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features (a total of 561).
- 'activity_labels.txt': Links the class labels (1 to 6) with their activity names (WALKING, SITTING, etc.).
- 'train/X_train.txt': Training data (including 7352 observations, 561 variables).
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/X_test.txt': Test data (including 2947 observations, 561 variables).
- 'test/y_test.txt': Test labels, ranging from 1 to 6. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

There are also Inertial Signals files available for the train and test data, which however have not been used in this project.

##Creating the tidy data file
The whole transformation process takes 6 parts:
* Downloads the data source from the website and put it into a folder called Project created in a working directory. 
* Loads both the training and the test datasets and merge them.
* Among a total of 561 feature variables, extracts only those variables/columns about the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the dataset (i.e., replaces the activity labels (1 to 6) with descriptive activity names for all 10299 observations)
* Labels the dataset with descriptive names (i.e., adds variable names and cleans them up)
* Creates an independent tidy dataset (tidydata.txt) with the average of each variable for each activity and each subject.

##Description of the tidydata.txt file
###Dimensions and summary of the dataset: 
The tidy data set has 180 observations of 81 variables. It summarizes the average of 79 selected variables/measurements in each of the 6 activities for each of the 30 subjects.

###Variables
All the variables in this dataset can be divided into two categories: Identifiers(2), Measurements(79).
#### Identifiers
* SubjectID: The ID of the subject who performed the activity.
* Activity: The type of activity performed by a subject when any measurements were taken. 

Class of these identifier variables: factor.

Unique values/levels of the variables:
* SubjectID - 30 levels (ranging from 1 through 30);
* Activity - 6 levels (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS).

####Measurements
Among the original 561 feature variables, I extracted only the entries that contain the string mean() or std(). The number of measurements I selected totals at 79. 

Class of these measurement variables: numeric.

The cleaned-up measurement variable names are as follows.
* tBodyAccelerometerMeanX
* tBodyAccelerometerMeanY
* tBodyAccelerometerMeanZ
* tBodyAccelerometerStdX
* tBodyAccelerometerStdY
* tBodyAccelerometerStdZ
* tGravityAccelerometerMeanX 
* tGravityAccelerometerMeanY
* tGravityAccelerometerMeanZ
* tGravityAccelerometerStdX
* tGravityAccelerometerStdY
* tGravityAccelerometerStdZ
* tBodyAccelerometerJerkMeanX           
* tBodyAccelerometerJerkMeanY
* tBodyAccelerometerJerkMeanZ
* tBodyAccelerometerJerkStdX
* tBodyAccelerometerJerkStdY
* tBodyAccelerometerJerkStdZ
* tBodyGyroscopeMeanX
* tBodyGyroscopeMeanY
* tBodyGyroscopeMeanZ
* tBodyGyroscopeStdX
* tBodyGyroscopeStdY
* tBodyGyroscopeStdZ
* tBodyGyroscopeJerkMeanX
* tBodyGyroscopeJerkMeanY
* tBodyGyroscopeJerkMeanZ
* tBodyGyroscopeJerkStdX             
* tBodyGyroscopeJerkStdY
* tBodyGyroscopeJerkStdZ
* tBodyAccelerometerMagnitudeMean
* tBodyAccelerometerMagnitudeStd
* tGravityAccelerometerMagnitudeMean
* tGravityAccelerometerMagnitudeStd
* tBodyAccelerometerJerkMagnitudeMean
* tBodyAccelerometerJerkMagnitudeStd
* tBodyGyroscopeMagnitudeMean
* tBodyGyroscopeMagnitudeStd
* tBodyGyroscopeJerkMagnitudeMean
* tBodyGyroscopeJerkMagnitudeStd
* fBodyAccelerometerMeanX
* fBodyAccelerometerMeanY
* fBodyAccelerometerMeanZ
* fBodyAccelerometerStdX
* fBodyAccelerometerStdY
* fBodyAccelerometerStdZ
* fBodyAccelerometerMeanFreqX
* fBodyAccelerometerMeanFreqY
* fBodyAccelerometerMeanFreqZ
* fBodyAccelerometerJerkMeanX
* fBodyAccelerometerJerkMeanY
* fBodyAccelerometerJerkMeanZ
* fBodyAccelerometerJerkStdX
* fBodyAccelerometerJerkStdY
* fBodyAccelerometerJerkStdZ
* fBodyAccelerometerJerkMeanFreqX
* fBodyAccelerometerJerkMeanFreqY
* fBodyAccelerometerJerkMeanFreqZ
* fBodyGyroscopeMeanX
* fBodyGyroscopeMeanY
* fBodyGyroscopeMeanZ               
* fBodyGyroscopeStdX
* fBodyGyroscopeStdY
* fBodyGyroscopeStdZ                 
* fBodyGyroscopeMeanFreqX
* fBodyGyroscopeMeanFreqY
* fBodyGyroscopeMeanFreqZ            
* fBodyAccelerometerMagnitudeMean
* fBodyAccelerometerMagnitudeStd
* fBodyAccelerometerMagnitudeMeanFreq     
* fBodyAccelerometerJerkMagnitudeMean
* fBodyAccelerometerJerkMagnitudeStd
* fBodyAccelerometerJerkMagnitudeMeanFreq 
* fBodyGyroscopeMagnitudeMean
* fBodyGyroscopeMagnitudeStd
* fBodyGyroscopeMagnitudeMeanFreq    
* fBodyGyroscopeJerkMagnitudeMean
* fBodyGyroscopeJerkMagnitudeStd
* fBodyGyroscopeJerkMagnitudeMeanFreq
