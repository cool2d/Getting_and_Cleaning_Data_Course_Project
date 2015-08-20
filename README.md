##Getting and Cleaning Data - Course Project

This repository hosts the project deliverables for the Coursera course 'Getting and Cleanning Data'. The objective of this project is to collect, process, and clean a raw dataset, and to produce tidy data that can be used for later analysis.

###Files in this repo
* CodeBook.md: Description of the variables, the raw and tidy datasets, and major transformations performed to clean up the data.
* README.md: This file.
* run_analysis.R: R script to download and transform a raw dataset to a tidy one, according to the course requirement.
* tidydata.txt: The end result (a tidy dataset) of running the R code.


The R script run_analysis.R does the following:
* Downloads the data source from the course website and put it into a folder called Project created in the working directory.
* Loads both the training and the test datasets and merge them to create one dataset.
* Extracts only those columns/variables about the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the dataset.
* Labels the dataset with readable and descriptive names.
* Creates another independent tidy dataset (tidydata.txt) with the average of each variable for each activity and each subject.

This run_analysis.R code can be directly launched and run in RStudio to create the tidydata.txt in the Project folder under the working directory. This run_analysis.R code depends on the plyr package, which will be automatically loaded if installed.

