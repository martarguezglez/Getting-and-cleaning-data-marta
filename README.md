README FOR TIDY DATA SET REQUIRED IN COURSERA "GETTING AND CLEANING DATA" COURSE
AUTHOR: MARTA RODRIGUEZ GONZALEZ
OUTPUT TIDY DATA SET IN: tidy_data_set.txt

In this readme file the way to obtain the tidy dataset required in the project is going to be explained.

I will explain what my script does (the script is also commented with this information) and I will explain
which principles I had into account.

1. Read files for obtaining the data:

The following files have been used for obtaining the data to calculate the tidy data set:

- UCI HAR Dataset/features.txt: used for obtaining the name of the data columns.
- UCI HAR Dataset/test/X_test.txt : used for obtaining the test data
- UCI HAR Dataset/train/X_train.txt : used for obtaining the train data
- UCI HAR Dataset/test/subject_test.txt: used for obtaining the subjects for the test data.
- UCI HAR Dataset/train/subject_train.txt : used for obtaining the subjects for the train data.
- UCI HAR Dataset/test/y_test.txt : used for obtaining the activities for the test data.
- UCI HAR Dataset/train/y_train.txt : used for obtaining the activities for the train data.
- UCI HAR Dataset/activity_labels.txt: used for convert the numbers obtained from the activities files to named activities.

2. Principles to name the columns.

The column names are according the standards:
- All lower case when possible
- Descriptive
- Not duplicated
- Not have underscores or dots or white spaces

The tidy data set has the following columns:


Column-1: sampleType: indicates where the observation comes from. If is comes from a test or a training sample. This information is considered
   		       useful because it is important for possible data analysis performed over the data set (e.g Regression Analysis).

Possible_values: "test","train"

Column-2: activity: type of activity performed by the subject for the observation. 

Possible values:  "laying","sitting","standing","walking","walking-dowstairs","walking-upstairs"

Column-3: subject: subject who perform the activity. There were 30 subjects.

Column-4 to Column-69: Contains the average performed over the mean and standarad deviation values for each activity and each subject. It is important to take into
account that the variables from the original data set containing "meanFreq" are not in scope for this analysis of the mean and standard deviation
because they are independent measures.


The transformations performed over the original dataset to obtain the name of the data columns are:

- Eliminate "(" and ")" characters which did not contribute any information.
- Extract via "grep" the variables containing "mean" and "std" but not containing "meanFreq".
- Convert to lower case all the variables.
- Replace "bodybody" in some variables that were wrongly named (according to the original features_info.txt) by body.

All the columns which could be transformed into factor type have been transformed.

3. Steps to obtain the tidy data set.

- First of all, read the column names from features.txt file. They will be the name of the observation columns. 
After, reading them, transform them to be character type and record them into a variable called column_names.

- Read test data from X_test.txt. The variable column_names is used to set the name of the columns.

- Read train data from X_train.txt. The variable column_names is used to set the name of the columns.

- Read test subjects data from subject_test.txt. Transform it to factor type.

- Read test subjects data from subject_train.txt. Transform it to factor type.

- Read the performed activities for test from y_test.txt.

- Read the performed activities for train from y_test.txt.

- Transform the activities numbers to descriptive activities names using a function
which reads activity_labels.txt. Tranform to factor type. Appropriately labels the data set 
with descriptive activity names. 

- Merges the training and the test sets to create one data set

- Extract the columns related to mean and standard deviation as required. Those columns
containing "meanFreq" are not in scope.

- Edit the column names according the previous point (Principles to name the columns)

- Create data.frames including the class of measure (test or train).

- Combine all the read data to have the first data frame required in the course project.

- Order the data frame (FIRST COURSE PROJECT DATA FRAME). It is important to take into account that the
the dataset has been ordered first by sample_type, then by activity and at the end by the subject. It
has been done in this way because I consider that it is importan to know where the sample comes from
(for possible later analysis as explained before). Then, I consider that the type of activity performed
to take the meassure is more important that the subject who performed it.

- Use the obtained data frame to have a wide data frame using melt function.

- Obtain the tidy dataset required in the course project by using the dcast function to apply 
the mean over the previous obtained data frame. SECOND COURSE PROJECT DATA FRAME

- Write the data set into a file as required. Do not writethe row names as numbers into the file.




