# Introduction

This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.

# About the raw data

There are 7352 data lines in the training data and 2947 data lines in the test data. The observations of the features can be found in the "x_train.txt" and "x_test.txt" files. Both of the files contain 561 columns, with each column corresponding to one feature in the "features.txt". The activity labels are in the "y_train.txt" and "y_test.txt" file. The volunteer subject indexes are in the "subject_train.txt" and "subject_test.txt" files.

# About the script and the tidy dataset

The script file is "run_analysis.R".

Prerequisites for this script:

* The UCI HAR Dataset must be extracted
* The UCI HAR Dataset must be available in a directory called "UCI HAR Dataset"

Here is a brief review of the data cleaning process:

First, The "x_train" and "x_test" are merged, with the 561 columns named "V1-V561". Similarly, the training and test data of activities and subjects are also merged. These data were bound to the end of the merged "x" as two columns named "activity" and "subject", resulting in a new data frame named "wc" ("wc" stands for "wearable computing"). The "wc" data frame is then sorted by ascending "subject" values.

Second, only columns that have "mean" or "std" in the names are kept. The resulting data frame is "wc1".

Third, the activities were labeled using numbers 1-6 in the "activity" column. The numbers were converted to the actual activity names in lower case according to the "activity_label.txt" file. The resulting data frame is "wc2".

Fourth, the column names V1-V561 were changed into descriptive feature names derived from "features.txt". For example, if the feature name is "tBodyAcc-mean()-X" in "features.txt", the corresponding column name is "tBodyAcc.mean.x". Note that the name is NOT in "all-lower-case" format. Although the instructor suggested "all-lower-case" format for the variable name in the lecture, I personally believe that lower and upper case combination helps with interpretation of the variable name.

Lastly, an independent tidy data set ("summary") was created with the average of each variable for each activity and each subject, using the "dplyr" library.

# About the Code Book

The "CodeBook.md" file explains the variables and summaries calculated, and any other relevant information.
