===================================================================================================
# Getting and Cleaning Data Course Project
# File Name: run_analysis.R 
# Submitted by: Daniel Wolff
# Version 1.0
===================================================================================================
# This program uses source data from the UCI Machine Learning Repository
# Human Activity Recognition Using Smartphone Data Set
# The source data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
===================================================================================================
# Run_analysis.R is an R script which manipulates the source data in order to produce a tidy data set.
# The run_analysis.R script executes the 13 steps below in order to produce the tidy data set.
===================================================================================================
# 1. Sets the working directory to be the Getting and Cleaning Data sub Directory
# 2. Reads the train and test data into R.  Train and test data is obtained from UCI Machine Learning Repository.
# 3. Extract activity name from the activities data frame.  Activity name is in the 2nd column of the data frame.
# 4. Extract feature names from features data frame then transpose it and convert it to a character vector
# 5. Format feature names so as to remove commas, blank spaces, parentheses and hyphens 
# 6. Subset the list of features to just show those which are related to mean or standard deviation.  Assign the subsetted
#    feature list to a new character vector
# 7. Assign headers to train and test data.  Header for y_train and y_test columns is "Activity" since these fields contain activities.
#    Header for subject_train and subject_test is "Subject" since these fields contain subjects.  
#    Header for X_train and X_test is feature_name character vector
# 8. Subset train and test data to just those fields related to mean or standard deviation, using the modified 
#    character vector created in step (6) 
# 9. Assign activity names to the y_test fields in both the train and test data
# 10.For both train and test data, combine subject, activity and measurements fields into a single table
# 11.Merge the train and test tables into a single table 
# 12.Group and summarize data by subject and activity, taking the mean of each measurement
# 13.Write tidy data table to a text file and a csv file in a sub-directory called "output"
===================================================================================================