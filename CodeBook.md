# Data source

The data was originally obtained from .. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The download link is .. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Feature Selection

The "README.txt" and "features.txt" files in the original data contain information about feature selection. Here is a brief summary of the information, with some technical details omited.

The experiments have been carried out with a group of 30 volunteers. There were 70% of the volunteers selected for generating the training data and 30% the test data. The volunteer index for each line of data is stored in the "subject_train.txt" and "subject_test.txt" files. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The six activities are coded into numbers 1 to 6 (refer to the "activity_labels.txt").

Using the embedded accelerometer and gyroscope in the smartphone, the time domain signals, 3-axial linear acceleration and 3-axial angular velocity, were captured ("tAcc-XYZ" and "tGyro-XYZ"). The accelerometer and gyroscope raw signals were pre-processed by applying noise filters and then sampled in fixed-width sliding windows. The acceleration and gyroscope signals were then separated into body and gravity signals ("tBodyAcc-XYZ" and "tGravityAcc-XYZ").

Subsequently, the body accelerometer and gyroscope signals were used to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

This is a list of the signals mentioned above:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
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
arCoeff(): Autoregression coefficients with Burg order equal to 4
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

The complete list of variables of each feature vector is available in 'features.txt'. All the features are normalized and bounded within [-1,1].
