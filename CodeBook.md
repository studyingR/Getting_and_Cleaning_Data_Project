# CodeBook

This code book describes variables, data and process for the Data Cleaning Project associated with runalaysis.R

## Data Source

Data Source Location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data Set Information
Input Data Zip file at data source location provided above contains multiple files 

Final Data set created by the run analysis.r produces a tidydataset with 180 rows of data and 68 columns.


## Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Implementation details

* Process reads & loads both test and train data for X, Y & subject
* As a next step the training and the test sets are merged for X, Y & subject to create one data set each
* Add column names to X merged data from features.txt
* Find the list of mean and standard measurements 
* Read and add activty labels to the data set
* Remove - and () from label names to cleanup the column names
* Process the data - Use aggregate function to find average of mean and std dev data and group by Activity and Subject
* Write the final tidy dataset to a text file.