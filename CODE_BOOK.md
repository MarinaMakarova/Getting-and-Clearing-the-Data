## CODE BOOK

#Initial data description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

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

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

#Donwloaded initial files:
(for detailed description, please, refer to Initial Data)

Activity
Data frame: [6x2]
Activity labels from activity_labels.txt
6 groups of activity (levels):
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

features        features.txt
activity        activity_labels.txt
features        features.txt
test1           X_test.txt
subject_test    subject_test.txt
y_test          y_test.txt
train1          X_train.txt
subject_train   subject_train.txt
y_train         y_train.txt

#Working data:

test2
Data frame [2947x563]
Subject         Person ID
Activity        Activity label 
[,3:563]        Measurments

train2
Data frame [7353x563]
Subject         Person ID
Activity        Activity label 
[,3:563]        Measurments

total1
Data frame [10299x563]
Subject         Person ID
Activity        Activity label 
[,3:563]        Measurments
total1 is combination of test1 and train1

mean_col
vector
length = 33
Variable columns that refer either to mean() 

std_col
vector
length = 33
Variable columns that refer either to std() 

mean_col_adj
vector
length = 33
mean_col variable abjust by 2 because of added columns "subject" and "activity" in the analysed merged data frame

std_col_adj
vector
length = 33
std_col variable abjust by adding 2 because of added columns "subject" and "activity" in the analysed merged data frame

col_num_mean_std
vector
length = 66
Column numbers of viriables that show either mean() or std()

total_mean_std
Data frame [10299x68]
Subject         Person ID
Activity        Activity label 
[,3:68]        Measurments
Data on mean and standard deviation measurments extracted from total1 data frame

melted
Data frame [679734x6]
subject         Person ID
activity        Activity label 
feature         Measurment code name (for details, please, see initial data)
"tBodyAcc"             "tGravityAcc"          "tBodyAccJerk"         "tBodyGyro"           
"tBodyGyroJerk"        "tBodyAccMag"          "tGravityAccMag"       "tBodyAccJerkMag"     
"tBodyGyroMag"         "tBodyGyroJerkMag"     "fBodyAcc"             "fBodyAccJerk"        
"fBodyGyro"            "fBodyAccMag"          "fBodyBodyAccJerkMag"  "fBodyBodyGyroMag"    
"fBodyBodyGyroJerkMag"
statistics      statistics calculated. Either mean or std (standard deviation)
dimension       for dimensional measurments: direction of movement (XYZ)
value           measurment value

melted_split
Data frame [679734x3]
Result of split function
feature         Measurment code name (for details, please, see initial data)
"tBodyAcc"             "tGravityAcc"          "tBodyAccJerk"         "tBodyGyro"           
"tBodyGyroJerk"        "tBodyAccMag"          "tGravityAccMag"       "tBodyAccJerkMag"     
"tBodyGyroMag"         "tBodyGyroJerkMag"     "fBodyAcc"             "fBodyAccJerk"        
"fBodyGyro"            "fBodyAccMag"          "fBodyBodyAccJerkMag"  "fBodyBodyGyroMag"    
"fBodyBodyGyroJerkMag"
statistics      statistics calculated. Either mean or std (standard deviation)
dimension       for dimensional measurments: direction of movement (XYZ)

avg
Data frame [11880x6]
Aggregated data from melted data frame
subject         Person ID
activity        Activity label 
feature         Measurment code name (for details, please, see initial data)
"tBodyAcc"             "tGravityAcc"          "tBodyAccJerk"         "tBodyGyro"           
"tBodyGyroJerk"        "tBodyAccMag"          "tGravityAccMag"       "tBodyAccJerkMag"     
"tBodyGyroMag"         "tBodyGyroJerkMag"     "fBodyAcc"             "fBodyAccJerk"        
"fBodyGyro"            "fBodyAccMag"          "fBodyBodyAccJerkMag"  "fBodyBodyGyroMag"    
"fBodyBodyGyroJerkMag"
statistics      statistics calculated. Either mean or std (standard deviation)
dimension       for dimensional measurments: direction of movement (XYZ)
mean_value      mean value for the measurment group

##Data manupulations performed in the script

1. Appropriate names were assigned to the variables in initial data frames (subject and activity)

2. For each, training and test, set 3 files (subject data, activity data, measurements) were merged into one dataframe. Two resulting dataframes (test1, train1) were constructed.

3. Labels were assigned to level of activity variable.

4. Colunm numbers of features that measure either mean (mean_col) or standard deviation (std_col) were found within features dataframe, adjusted (mean_col_adj, std_col_adj) for the dataframes from the step 2 (test1, train1) considerind 2 added columns, and combined into unique vector (col_num_mean_std).

5. Using for loop and cbind function mean and standard deviation measurments were combined to form a new dataframe (total_mean_std).

6. Resulting data frame (total_mean_std) was melted to form a tidy data.

7. Using colsplit() function 'feature' variable were split into actual features, statistics on that feature (mean or std), and dimension for dimension measures (X,Y, or Z directions).

8. Using aggregate() function the 'melted' tidy data set was grouped by all non-numerical variables ("subject"    "activity"   "feature"    "statistics" "dimension" ) to calculate mean value for each measurment.