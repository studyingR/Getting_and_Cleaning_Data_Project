# 1. Merges the training and the test sets to create one data set

# Read the train data files
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
sub_train <- read.table("train/subject_train.txt")

# Read the test data files
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
sub_test <- read.table("test/subject_test.txt")

# Merge the respective train and test files into X,Y & S
X <- rbind(x_train,x_test)
Y<- rbind(y_train,y_test)
S<- rbind(sub_train,sub_test)

# Add column names to X merged data from features.txt
features <- read.table("features.txt")
colnames(X) <- features[,2]

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Find the list of mean and standard measurements 
subsetfeatures <- features[grep("(mean|std)\\(", features[,2]),]
mean_or_std_X <- X[,subsetfeatures[,1]]

# 3. Uses descriptive activity names to name the activities in the data set

# Read and add activty labels to the data set
activities <- read.table("activity_labels.txt")
Y[,1] = activities[Y[,1], 2]
colnames(Y) <- "Activity"


#4 Appropriately labels the data set with descriptive variable names. 
# Remove - and () from label names
	subsetfeatures[,2] <- gsub("-","",subsetfeatures[,2])
	subsetfeatures[,2] <- gsub("\\()","",subsetfeatures[,2])
	colnames(mean_or_std_X) <-subsetfeatures[,2] 
	
	
#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#Merge the susbetted X & Y data sets
merged <- cbind(mean_or_std_X,Y)

#Add "Subject" column name to S data set
colnames(S) <- "Subject"

# Merge subject data with X & Y merged data
merged <- cbind(merged,S)


# Use aggregate to find average of mean and std dev data and group by Activity and Subject
attach(merged)
tidydata <- aggregate(merged, by=list(Activity,Subject), FUN=mean)  ## Aggregate to find average of each mean and standard deviation and group by activity and subject


# Drop duplicate columns produced by aggregate
# Keep first 68 columns (drop last 2)
keep_columns <- tidydata[c(1:68)]                          

# Add column headers to the first two columns
colnames(keep_columns)[1] <- "Activity"
colnames(keep_columns)[2] <- "Subject"

finaldataset <- keep_columns

## Write the final dataset produced into a text file
write.table(finaldataset,"./tidydataset.txt",row.names=F)