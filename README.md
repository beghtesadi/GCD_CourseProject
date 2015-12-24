---
title: "Getting and Cleaning data - Course project"
author: "Bahareh Eghtesadi"
date: "December 23, 2015"
output: html_document
---

The project is to obtain a non-tidy dataset of accelerometers data from the Samsung Galaxy S smartphone and create a tidy data set. This data set is used for furtur analysis. The data for this project is obtained from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The required steps to complete the project are:

1.Merges the training and the test sets to create one data set.  
2.Extracts only the measurements on the mean and standard deviation for each measurement.  
3.Uses descriptive activity names to name the activities in the data set.  
4.Appropriately labels the data set with descriptive variable names.   
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This Github repository provides a script (run_analysis.R), a tidy dataset (tidymeans.txt), and a codebook (CodeBook.md).

#run_analysis.R
The script was implemented under Ubuntu 14.04 and RStudio. The following steps are performed in the script:

- Loads the data set from current working directory.  
- Reads trainig and test data sets and merges them into a single data frame.  
- Extracts the variables that are related to mean and std of measurements.  
- Uses descriptive names for variables.  
- Reads the subjects and activity labels. Uses descriptive activity labels.
- Creates a tidy data set that contains the mean of each variable for each subject and activity.  

#CodeBook.md
The CodeBook contains a description of the original dataset, the data acquisition process, the data transformation process, the variables, and the tidy dataset format.