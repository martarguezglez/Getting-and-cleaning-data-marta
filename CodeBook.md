CODEBOOK FOR TIDY DATA SET REQUIRED IN COURSERA "GETTING AND CLEANING DATA" COURSE
AUTHOR: MARTA RODRIGUEZ GONZALEZ
OUTPUT TIDY DATA SET IN: tidy_data_set.txt

1. Database data description.

The data set contains data from "Human Activity Recognition Using Smartphones Data Set".

Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

In the current (project) dataset only "mean values" and "standard deviation" values have been taken into account.

For each variable (mean and standard deviation observation values) the average was calculated for each activity and each subject.

2. Columns data descrition


The column names are according the standards:
-All lower case when possible
-Descriptive
-Not duplicated
-Not have underscores or dots or white spaces

The data set contains 69 variables/columns. 

Column-1: sampleType: indicates where the observation comes from. If is comes from a test or a training sample. This information is considered
   		       useful because it is important for possible data analysis performed over the data set (e.g Regression Analysis).

Possible_values: "test","train"

Column-2: activity: type of activity performed by the subject for the observation. 

Possible values:  "laying","sitting","standing","walking","walking-dowstairs","walking-upstairs"

Column-3: subject: subject who perform the activity. There were 30 subjects.

Column-4 to Column-69:

Contains the average performed over the mean and standarad deviation values for each activity and each subject. It is important to take into
account that the variables from the original data set containing "meanFreq" are not in scope for this analysis of the mean and standard deviation
because they are independent measures.

The name of the columns refers to:

- If the name starts whit a "t" indicates time domain signals. If it starts with an "f" indicates frequency domain signals.
- If the name contains  "body" it refers to a body acceleration signal. If the name contains "gravity" it refers to a gravity acceleration signal.
- If the name contains "acc" it refers to a measure taken with the accelerometer. If the name contains "gyro" it refers to a measure taken with the gyroscope.
- If the name contains "jerk" it refers to a Jerk signal obtained by deriving body linear acceleration and angular velocity.
- If the name contains "mag" it refers to the magnitude of the three-dimensional signals calculated using the Euclidean.
- If the name does not contain "mag", the last letter refers to axis the mesure was taken from.

The transformations performed over the original dataset to obtain this columns (columns from 4 to 69) have been:

-Eliminate "(" and ")" characters which did not contribute any information.
-Extract via "grep" the variables containing "mean" and "std" but not containing "meanFreq"
-Convert to lower case all the variables.
-Replace "bodybody" in some variables that were wrongly named (according to the original features_info.txt) by body.
