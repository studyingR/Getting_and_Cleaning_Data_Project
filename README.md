Getting_and_Cleaning_Data_Project
=================================
Step 1: Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) to a folder on your pc. For example C:\TEMP\DATAPROJ\

Step 2: Download the run_analysis.R to C:\TEMP\DATAPROJ\UCI HAR Dataset\

Step 3: Open R studio and set working directory to 
C:\TEMP\DATAPROJ\UCI HAR Dataset\

Step 4: Run the analysis code by using the command
source("run_analysis.R")

Step 5: The R script will process the data files in the folder and carries out the following tasks - 

a. Merges the training and the test sets to create one data set.

b. Extracts only the measurements on the mean and standard deviation for each measurement.

c. Uses descriptive activity names to name the activities in the data set

d. Appropriately labels the data set with descriptive variable names.

e.Creates a second, independent tidy data set [ tidydataset.txt] with the average of each variable for each activity and each subject.

Please Note : Final output file tidydataset.txt has 180 rows and 68 columns. There is one row for each activity and subject combination and there are a total of 66 average or std dev columns for each combination.
