library(reshape2)

## Function that converts the activities numbers into
## named activities
transform_activity <- function (activity_in) {
	
	##Read activities labels
	activities_info <- read.table ("./UCI HAR Dataset/activity_labels.txt",sep = " ")

	for (i in 1:length(activity_in$activity)){
		activity_in[i,] = sub("_","-",tolower(activities_info[activity_in[i,],]$V2))
	}
	activity_in
}

	

##First of all, read the column names from features.txt file. They will be
##the name of the observation columns. After, reading them, transform them
## to be character type and record them into a variable called column_names

raw_column_names <- read.table ("./UCI HAR Dataset/features.txt",sep = " ")

column_names <- as.character (raw_column_names[[2]])

##Read test data from /test/X_test.txt. The variable column_names is used
##to set the name of the columns.

test_data <- read.table ("./UCI HAR Dataset/test/X_test.txt",col.names=column_names)

##Read train data from /train/X_train.txt. The variable column_names is used
##to set the name of the columns.

train_data <- read.table ("./UCI HAR Dataset/train/X_train.txt",col.names=column_names)


##Read test subjects data from /test/subject_test.txt

test_subjects_data <- read.table ("./UCI HAR Dataset/test/subject_test.txt",col.names="subject")

##The columns with characters data are converted to be factor type.

test_subjects_data[,1] <- as.factor(test_subjects_data[,1])

##Read test subjects data from /train/subject_train.txt

train_subjects_data <- read.table ("./UCI HAR Dataset/train/subject_train.txt",col.names="subject")

##The columns with characters data are converted to be factor type.

train_subjects_data[,1] <- as.factor(train_subjects_data[,1])

##Read the performed activities for test from /test/y_test.txt.

test_activity <- read.table ("./UCI HAR Dataset/test/y_test.txt",col.names="activity")

##Read the performed activities for train from /train/y_test.txt.

train_activity <- read.table ("./UCI HAR Dataset/train/y_train.txt",col.names="activity")

##Transform the activities numbers to descriptive activities names.
##Appropriately labels the data set with descriptive activity names. 

test_activity <- transform_activity (test_activity)

train_activity <- transform_activity (train_activity)

##The columns with characters data are converted to be factor type.

test_activity[,1] <- as.factor(test_activity[,1])

train_activity[,1] <- as.factor(train_activity[,1])

##Merges the training and the test sets to create one data set.

test_and_train_data_set <- rbind (test_data,train_data)


##Extract the columns related to mean and standard deviation as required. Those columns
##containing "meanFreq" are not in scope.

mean_and_std_names <- grep("mean|std",names(test_and_train_data_set),value=TRUE)

test_and_train_data_set <- test_and_train_data_set[,grep ("meanFreq",mean_and_std_names,value=TRUE,invert=TRUE)]

##Edit the name of the columns to be
## All lower case when possible
## Descriptive
## Not duplicated
## Not have underscores or dots or white spaces
##Uses descriptive activity names to name the activities in the data set

##Eliminate "."
##In the original data set there were some columns wrong named that contained "bodybody" instead
##of only "body". It is well formatted in the new data set.

names(test_and_train_data_set) <- sub("bodybody","body",sub("\\.","",tolower (sub("\\.\\.","",sub("\\.\\.\\.","",names(test_and_train_data_set))))))


## Create data.frames including the class of measure (test or train).

test_id <- data.frame (sampleType = as.factor (rep("test",length(test_subjects_data[,1]))))

train_id <- data.frame (sampleType = as.factor (rep("train",length(train_subjects_data[,1]))))

subjects_data <- rbind (test_subjects_data,train_subjects_data)

activities_data <- rbind (test_activity,train_activity)

ids_data <- rbind (test_id,train_id)

##Combine all the read data to have the first data frame required
##in the course project.

data_frame <- cbind (ids_data,activities_data,subjects_data,test_and_train_data_set)

##Order the data frame (FIRST COURSE PROJECT DATA FRAME)

data_frame <- data_frame[order(data_frame$sampleType,data_frame$activity,data_frame$subject),]

##Use the obtained data frame to have a wide data frame using melt
##function.

extended_data_frame <- melt(data_frame,id=c("sampleType","activity","subject"),measure.vars=names(test_and_train_data_set))

##Obtain the tidy dataset required in the course project by
##using the dcast function to apply the mean over the previous
##obtained data frame.
##Creates a second, independent tidy data set with the average of each 
##variable for each activity and each subject. 
##SECOND COURSE PROJECT DATA FRAME

tidy_data_set <-  dcast (extended_data_frame, sampleType + activity + subject ~ variable, mean)

##Write the data set into a file as required. Do not write
##the row names as numbers into the file.

write.table (tidy_data_set,"tidy_data_set.txt",row.names=FALSE)

