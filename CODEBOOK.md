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
# The run_analysis.R script uses the following __ variables in order to produce the tidy data set.
===================================================================================================
# 1. subject_train - data frame created from source training data which describes the subject (1-30)
# 2. X_train - data frame created from source training data which describes the measurement results
# 3. y_train - data frame created from source training data which describes the activity (1-6)
# 4. subject_test - data frame created from source test data which describes the subject (1-30)
# 5. X_test - data frame created from source test data which describes the measurement results 
# 6. y_test - data frame created from source test data which describes the activity (1-6)
# 7. features - data frame created from source feature list
# 8. activities - data frame created from source activity list
# 9. activities2 - sub-setted version of activity data frame; 2nd column only
# 10.feature_name - sub-setted version of features data frame; 2nd column is transposed and sorted
# 11.NumFeatures - total number of types of measurements recorded
# 12.array - array from 1 to NumFeatures which is used to cycle through the for loop
# 13.h - formatted character string which represents the formatted version of the feature name
# 14.subFeaturesSorted - subsetted and sorted list of just those features which are either mean or std
# 15.X_test2 - X_test measurement results subsetted to just show features related to mean or std.  Uses subFeaturesSorted variable to subset the columns.
# 16.X_train2 - X_train measurement results subsetted to just show features related to mean or std.  Uses subFeaturesSorted variable to subset the columns.
# 17.train_merged - measurement, activity and subject training data merged into a single table
# 18.test_merged - measurement, activity and subject testing data merged into a single table
# 19.train_and_test - training and testing data merged into a single table.  Uses train_merged and test_merged.
# 20.train_and_test2 - train_and_test data is grouped by activity and subject
# 21.train_and_test3 - compute average of each measurement
===================================================================================================