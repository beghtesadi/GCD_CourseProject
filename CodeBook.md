---
title: "CodeBook"
author: "Bahareh Eghtesadi"
date: "December 23, 2015"
output: html_document
---

The original data for this project is downloaded from the following website:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A describtion of the data set from the mentioned website is taken as follow:   

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

#Data Aquisation
Data is downlowded into the current working directory. Then it is loaded from the script. 

#Data Processing
1. ./train/X_train.txt and ./test/X_test.txt are read using read.table in the script. Then, these two tables are combined using rbind() function. The resulting tables contains 10299 observations and 561 variables.

2. features.txt is read into a table. This file contains the name of each variable that appears in the training and test data sets. There are 561 rows and 2 columns for this file. The column names in this file are used to rename the variable names in the data set from step 1.

3. ./train/subject_train.txt and ./test/subject_test.txt files are then loaded in the script. These files contains the number of subject to which each measurments belongs. Using rbind(), we combine these two files. The resulting table has 10299 rows and one column.

4. ./train/y_train.txt and ./test/y_test.txt are loaded and combined via the rbind() command. These files contain the activity number for each observation. Then, using activity_labels.txt, each activity number is translated to a descriptive name. Then, this table and the activity_labels table are connected using cbind().

5. From the main dataset created in step 2, we extract all the columns that their name contains eaither "mean" or "std". 

6. A new tidy data set is created. The subject and activity labels are inserted as first two columns. Then, other columns are added. These columns contain the average of each variable from step5 across each subject and activity. The tidy data set is written as atable in tidy.txt file.

#Variables
First column in the tidy data set is the subject variavle. This variable is a sequence integer numbers between 1 and 30. Each number refers to one subject in the experiment. The second column is the activity labels. the values of this column belongs to the set of 
{ WALKING , WALKING_UPSTAIRS, WALKING_DOWNSTAIRS , SITTING , STANDING, LAYING}
All other columns (3:81) are the variables relating to the mean/std of the measurements. These columns are as follows:

"1" "Subject"  
"2" "Activity"  
"3" "tBodyAcc-mean()-X"  
"4" "tBodyAcc-mean()-Y"  
"5" "tBodyAcc-mean()-Z"  
"6" "tBodyAcc-std()-X"  
"7" "tBodyAcc-std()-Y"  
"8" "tBodyAcc-std()-Z"  
"9" "tGravityAcc-mean()-X"  
"10" "tGravityAcc-mean()-Y"  
"11" "tGravityAcc-mean()-Z"  
"12" "tGravityAcc-std()-X"  
"13" "tGravityAcc-std()-Y"  
"14" "tGravityAcc-std()-Z"  
"15" "tBodyAccJerk-mean()-X"  
"16" "tBodyAccJerk-mean()-Y"  
"17" "tBodyAccJerk-mean()-Z"  
"18" "tBodyAccJerk-std()-X"  
"19" "tBodyAccJerk-std()-Y"  
"20" "tBodyAccJerk-std()-Z"  
"21" "tBodyGyro-mean()-X"  
"22" "tBodyGyro-mean()-Y"  
"23" "tBodyGyro-mean()-Z"  
"24" "tBodyGyro-std()-X"  
"25" "tBodyGyro-std()-Y"  
"26" "tBodyGyro-std()-Z"  
"27" "tBodyGyroJerk-mean()-X"  
"28" "tBodyGyroJerk-mean()-Y"  
"29" "tBodyGyroJerk-mean()-Z"  
"30" "tBodyGyroJerk-std()-X"  
"31" "tBodyGyroJerk-std()-Y"  
"32" "tBodyGyroJerk-std()-Z"  
"33" "tBodyAccMag-mean()"   
"34" "tBodyAccMag-std()"  
"35" "tGravityAccMag-mean()"  
"36" "tGravityAccMag-std()"   
"37" "tBodyAccJerkMag-mean()"  
"38" "tBodyAccJerkMag-std()"  
"39" "tBodyGyroMag-mean()"  
"40" "tBodyGyroMag-std()"  
"41" "tBodyGyroJerkMag-mean()"  
"42" "tBodyGyroJerkMag-std()"  
"43" "fBodyAcc-mean()-X"  
"44" "fBodyAcc-mean()-Y"  
"45" "fBodyAcc-mean()-Z"  
"46" "fBodyAcc-std()-X"  
"47" "fBodyAcc-std()-Y"  
"48" "fBodyAcc-std()-Z"  
"49" "fBodyAcc-meanFreq()-X"  
"50" "fBodyAcc-meanFreq()-Y"  
"51" "fBodyAcc-meanFreq()-Z"  
"52" "fBodyAccJerk-mean()-X"  
"53" "fBodyAccJerk-mean()-Y"  
"54" "fBodyAccJerk-mean()-Z"  
"55" "fBodyAccJerk-std()-X"  
"56" "fBodyAccJerk-std()-Y"  
"57" "fBodyAccJerk-std()-Z"   
"58" "fBodyAccJerk-meanFreq()-X"  
"59" "fBodyAccJerk-meanFreq()-Y"  
"60" "fBodyAccJerk-meanFreq()-Z"  
"61" "fBodyGyro-mean()-X"  
"62" "fBodyGyro-mean()-Y"  
"63" "fBodyGyro-mean()-Z"  
"64" "fBodyGyro-std()-X"  
"65" "fBodyGyro-std()-Y"  
"66" "fBodyGyro-std()-Z"   
"67" "fBodyGyro-meanFreq()-X"  
"68" "fBodyGyro-meanFreq()-Y"  
"69" "fBodyGyro-meanFreq()-Z"  
"70" "fBodyAccMag-mean()"  
"71" "fBodyAccMag-std()"  
"72" "fBodyAccMag-meanFreq()"  
"73" "fBodyBodyAccJerkMag-mean()"  
"74" "fBodyBodyAccJerkMag-std()"  
"75" "fBodyBodyAccJerkMag-meanFreq()"  
"76" "fBodyBodyGyroMag-mean()"  
"77" "fBodyBodyGyroMag-std()"  
"78" "fBodyBodyGyroMag-meanFreq()"  
"79" "fBodyBodyGyroJerkMag-mean()"  
"80" "fBodyBodyGyroJerkMag-std()"  
"81" "fBodyBodyGyroJerkMag-meanFreq()"  

In the column names, t is time, f is the frequency, body and gravity are reference frames, acc is the accelerometer, gyro is the gyroscope, mag is the euclidean magnitude, mean is the average value, and std is the standard deviation. Jerk, where present, is the jerk signal, as opposed to smooth signal.

#Tidy DataSet
The tidy data set is written as a table in the tidy.txt file. The first row shows the column names. All columns are seprated with a single space.